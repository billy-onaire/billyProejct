package org.kh.billy.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.time.Instant;
import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.kh.billy.common.MailHandler;
import org.kh.billy.javaApache.model.request.Cancel;
import org.kh.billy.javaApache.model.request.SubscribeBilling;
import org.kh.billy.member.model.vo.Member;
import org.kh.billy.payment.model.service.BootpayApi;
import org.kh.billy.payment.model.service.PaymentService;
import org.kh.billy.payment.model.vo.Payment;
import org.kh.billy.payment.model.vo.PaymentCri;
import org.kh.billy.payment.model.vo.PaymentPageMaker;
import org.kh.billy.payment.model.vo.sendInvoice;
import org.kh.billy.statistics.model.service.StatisticsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@Controller
@SessionAttributes("loginMember") 
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private PaymentService payService;
	
	@Autowired
	private StatisticsService stService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	static BootpayApi api;
	
	@RequestMapping(value="paymentSearch.do")
	public ModelAndView searchList(PaymentCri payCri, ModelAndView mav, HttpSession login) {
		//거래&결제내역
		String customer = ((Member)login.getAttribute("loginMember")).getUser_id();
		payCri.setCustomer(customer);
		
		ArrayList<Payment> p = payService.listCriteria(payCri);
		mav.addObject("pmList", p);
		PaymentPageMaker pageMaker = new PaymentPageMaker(payCri);
		
		int totalCount = payService.searchListCount(payCri);
		pageMaker.setTotalCount(totalCount);
		
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("payment/paylistMypage");
		
		return mav;
	}
	@RequestMapping("paymentWaiting.do")
	public ModelAndView paymentWaiting(PaymentCri payCri, ModelAndView mav, HttpSession login) throws ParseException {
		String customer = ((Member)login.getAttribute("loginMember")).getUser_id();
		payCri.setCustomer(customer);
		
		PaymentPageMaker pageMaker = new PaymentPageMaker(payCri);
		pageMaker.setTotalCount(payService.searchWaitingListCount(payCri));
		
		mav.addObject("pmList", payService.listWatingCriteria(payCri));
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("payment/paymentWaiting");
		
		logger.info(mav.toString());
		logger.info("customer : " + payCri.getCustomer());
		
		return mav;
	}
	@RequestMapping(value="doPayment.do")
	public void doPayment(@RequestBody String param, HttpServletResponse response) throws IOException, ParseException {
		JSONParser parsing = new JSONParser();
		Object obj = parsing.parse(param);
		JSONObject jobj = (JSONObject)obj;
		logger.info("obj : " + obj.toString());
		
		String no = (String)jobj.get("no");
		int paymentNo = Integer.parseInt(no);
				
		int re = payService.updatePaymentUser(paymentNo);
		logger.info("re : " + String.valueOf(re));
		
		JSONObject ob = new JSONObject();
		ob.put("price", jobj.get("price"));
		ob.put("name", jobj.get("name"));
		logger.info("ob : " + ob.toJSONString());
		response.setContentType("application/json; charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.println(ob.toJSONString());
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value="bookingPage.do")
	public ModelAndView bookingPage(Payment payment, ArrayList<Payment> myPmList, ModelAndView mav) {
		//예약 영수증
		logger.info("customer: " + payment.getCustomer());
		logger.info("seller_id : " + payment.getSeller_id());
		logger.info("p name : " + payment.getProduct_name());
		logger.info("payment : " + payment);

		mav.addObject("payment", payment);
		mav.setViewName("payment/bookingPage");
		
		return mav;
	}
	@RequestMapping(value="upquan.do", method=RequestMethod.POST)
	public ResponseEntity<String>  bookingQuantity(@RequestBody String param, Payment payment) throws ParseException {
		//product table quantity업데이트, booking insert, 결제대기 insert
		JSONParser parsing = new JSONParser();
		Object obj = parsing.parse(param);
		JSONObject jobj = (JSONObject)obj;
		logger.info("obj : " + obj.toString());
		
		int productNo = Integer.parseInt((String)jobj.get("proNo"));
		int price = Integer.parseInt((String)jobj.get("price"));
		String customer = (String)jobj.get("customer");

		Instant instante = Instant.parse((String)jobj.get("edate"));
		Instant instantb = Instant.parse((String)jobj.get("bdate"));		
		java.util.Date edate = java.util.Date.from(instante);
		java.util.Date bdate = java.util.Date.from(instantb);
		Date endDate = new Date(edate.getTime());
		Date beginDate = new Date(bdate.getTime());
		
		int quantity = Integer.parseInt((String)jobj.get("quantity"));
		
		payment.setProduct_no(productNo);
		payment.setPayment_price(price);
		payment.setCustomer(customer);
		payment.setPayment_enddate(endDate);
		payment.setPayment_begindate(beginDate);
		payment.setPayment_quantity(quantity);
		
		int re = payService.insertBookingList(payment);
		
		if(re == 1) {
			payment = payService.selectBookingUser(payment);
		}
		payService.updateProductQuantity(payment);
		
		return new ResponseEntity<String>("booking success", HttpStatus.OK);
	}
	
	@RequestMapping(value="resultPay.do")
	public ModelAndView resultList(@RequestParam(name="pno") int paymentNo, HttpServletResponse response, ModelAndView mav) throws ParseException, IOException {
		//영수증
		Payment payment = payService.selectPaymentListOne(paymentNo);
		logger.info("invoice payment : " + payment);
		
		mav.addObject("payment", payment);
		mav.setViewName("payment/paymentPage");
		
		return mav;
	}
	
	@RequestMapping(value="sendInvoiceEmail.do", method=RequestMethod.POST)
	public ResponseEntity<String> sendInvoiceEmail(@RequestBody String param) throws ParseException, UnsupportedEncodingException, MessagingException {
		//결제가 성공적으로 완료되면 이메일로 영수증 보내기
		JSONParser parsing = new JSONParser();
		Object obj = parsing.parse(param);
		JSONObject jobj = (JSONObject)obj;
		logger.info("email : " + obj.toString());
		logger.info("<pre>"+(String)jobj.get("pname")+"</pre>");
		String email = (String)jobj.get("email");
		String pname = (String)jobj.get("pname");
		String price = (String)jobj.get("price");
		
		String content = new sendInvoice().sendInvoiceMail(email, pname, price);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("billy 결제완료 이메일입니다");
		sendMail.setText(new StringBuffer().append(content).toString());
		sendMail.setFrom("billy", "billy");
		sendMail.setTo((String)jobj.get("email"));
		sendMail.send();
		
		stService.insertDeal();
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	 
	@RequestMapping("chargeList.do")
	public ModelAndView chargeListCriteria(PaymentCri payCri, ModelAndView mav, HttpSession login) {
		//판매완료 목록 조회
		String customer = ((Member)login.getAttribute("loginMember")).getUser_id();
		payCri.setCustomer(customer);
		
		ArrayList<Payment> p = payService.chargeListCriteria(payCri);
		
		countSellList(p.size());
		
		mav.addObject("pmList", p);
		PaymentPageMaker pageMaker = new PaymentPageMaker(payCri);
		
		int totalCount = payService.searchListCount(payCri);
		pageMaker.setTotalCount(totalCount);
		
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("payment/chargelistMypage");
		
		return mav;
	}
	
	@RequestMapping("chargeWating.do")
	public ModelAndView chargeWaitingListCriteria(PaymentCri payCri, ModelAndView mav, HttpSession login) {
		//판매대기중 목록
		String customer = ((Member)login.getAttribute("loginMember")).getUser_id();
		payCri.setCustomer(customer);
		
		PaymentPageMaker pageMaker = new PaymentPageMaker(payCri);
		pageMaker.setTotalCount(payService.searchWaitingListCount(payCri));
		
		mav.addObject("pmList", payService.chargeWaitingListCriteria(payCri));
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("payment/chargeWaiting");
		
		logger.info(mav.toString());
		logger.info("customer : " + payCri.getCustomer());
		
		return mav;
	}
	
	@RequestMapping(value="confimPay.do", method=RequestMethod.POST)
	public ResponseEntity<String> confirmPay(@RequestBody String param, ModelAndView model) throws ParseException {
		//결제수락용
		logger.info("confirmPay : " + param);
		JSONParser parsing = new JSONParser();
		Object obj = parsing.parse(param);
		JSONObject jobj = (JSONObject)obj;
		
		String status = (String)jobj.get("confirmPay");
		int paymentNo = Integer.parseInt((String)jobj.get("paymentNo"));
		
		Payment payment = payService.selectPaymentListOne(paymentNo);
		
		if(status.equals("ok")) {
			int re = payService.updateAdmitCharge(paymentNo);
			logger.info("charge ok : " + String.valueOf(re));
		} else if(status.equals("cancel")) {
			int re = payService.updateRejectCharge(paymentNo);
			int reCancel = payService.updateRejectChargeCustomer(payment);
			
			logger.info("charge cancel : " + String.valueOf(re));
			logger.info("charge cancel : " + String.valueOf(reCancel));
		}
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	
	@RequestMapping(value="dontwantpay.do", method=RequestMethod.POST)
	public ResponseEntity<String> dontWantPay(@RequestBody String param) throws ParseException {
		JSONParser parsing = new JSONParser();
		Object obj = parsing.parse(param);
		JSONObject jobj = (JSONObject)obj;
		
		int paymentNo = Integer.parseInt((String)jobj.get("no"));
		Payment payment = payService.selectPaymentListOne(paymentNo);
		
		int re = payService.updateRejectChargeCustomer(payment);
		int statusre = payService.updateRejectCharge(paymentNo);
		
		logger.info("결제 취소 재고업데이트 여부  : " + String.valueOf(re));
		logger.info("결제 취소 상태 여부  : " + String.valueOf(statusre));
		
		if(re == 1 && statusre == 1)
			return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		else
			return new ResponseEntity<String>("SUCCESS", HttpStatus.NO_CONTENT);
	}
	//구매완료 횟수
	public ModelAndView countBuyList(int buyList) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	//판매완료 횟수
	public ModelAndView countSellList(int sellList) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	
	// 부트페이 관련 메소드 =======================================================================================
	@RequestMapping("goPayPage.do")
	public String paymentPage() {
		api = new BootpayApi("5cc01b9c396fa67735bd0668", "rUqf5N0F42iUbj8SSNLCF7Rqyc/pPxa7HLkqq2k/5m4=");
		goGetToken();
		goVerify();
		goCancel();
		goSubscribebilling();
		
		return "payment/paymentPage";
	}
	
	public static void goGetToken() {
		try {
			api.getAccessToken();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void goVerify() {
		try {
			HttpResponse res = api.verify("5cc01b9c396fa67735bd0668");
			String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
			
			logger.info("goVerigy : " + str);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void goCancel() {
		Cancel cancel = new Cancel();
		cancel.receipt_id = "5cc01b9c396fa67735bd0668";
		cancel.name = "관리자 안정은";
		cancel.reason = "물품이 낙후암에 따른 구매자 취소 요청";
		
		try {
			HttpResponse res = api.cancel(cancel);
			String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
			
			logger.info("goCancel : " + str);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void goSubscribebilling() {
		//정기결제용
		SubscribeBilling subscribeBilling = new SubscribeBilling();
		subscribeBilling.billing_key = "5b025b33e13f33310ce560fb";
		subscribeBilling.item_name = "결제 테스트 아이템";
		subscribeBilling.price = 3000;
		subscribeBilling.order_id = "" + (System.currentTimeMillis() / 1000); //고객사에서 관리하는 주문번호. 고유값으로 생성 후 부트페이에 전달
		
		try {
			HttpResponse res = api.subscribe_billing(subscribeBilling);
			String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
			
			logger.info("gosubscribeBilling : " + str);
			logger.info("gosubscribeBilling GSON: " + new Gson().toJson(subscribeBilling));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
