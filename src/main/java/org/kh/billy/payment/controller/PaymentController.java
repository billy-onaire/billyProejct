package org.kh.billy.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.kh.billy.javaApache.model.request.Cancel;
import org.kh.billy.javaApache.model.request.SubscribeBilling;
import org.kh.billy.member.model.vo.Member;
import org.kh.billy.payment.model.service.BootpayApi;
import org.kh.billy.payment.model.service.PaymentService;
import org.kh.billy.payment.model.vo.Payment;
import org.kh.billy.payment.model.vo.PaymentCri;
import org.kh.billy.payment.model.vo.PaymentPageMaker;
import org.kh.billy.payment.model.vo.PaymentPaging;
import org.kh.billy.payment.model.vo.PaymentSearchCri;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	static BootpayApi api;
	
	@RequestMapping(value="paymentSearch.do")
	public ModelAndView searchList(PaymentCri payCri, ModelAndView mav) {
		//거래&결제내역
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
	public ModelAndView paymentWaiting(PaymentCri payCri, ModelAndView mav, HttpServletRequest request) {
		//결제대기 내역
		payCri.setCustomer(request.getSession().getId());
		
		PaymentPageMaker pageMaker = new PaymentPageMaker(payCri);
		pageMaker.setTotalCount(payService.searchWaitingListCount(payCri));
		
		mav.addObject("pmList", payService.listWatingCriteria(payCri));
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("payment/paymentWaiting");
		
		logger.info(mav.toString());
		logger.info("customer : " + payCri.getCustomer());
		
		return mav;
	}
	@RequestMapping(value="doPayment.do", method=RequestMethod.POST)
	public void doPayment(@RequestBody String param, HttpServletResponse response) throws IOException, ParseException {
		
		JSONParser parsing = new JSONParser();
		Object obj = parsing.parse(param);
		JSONObject jobj = (JSONObject)obj;
		logger.info("obj : " + obj.toString());
		
		JSONObject ob = new JSONObject();
		ob.put("price", jobj.get("price"));
		ob.put("name", jobj.get("name"));
		logger.info("ob : " + ob.toJSONString());
		response.setContentType("application/json; charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.println(ob.toJSONString());
		pw.flush();
		pw.close();
		
		/*logger.info("jar size : " + jar.size());
		
		for(int i = 0; i < jar.size(); i ++) {
			JSONObject job = (JSONObject)jar.get(i);
			Payment payment = new Payment();
			payment.setPayment_price(((Long) job.get("price")).intValue());
			payment.setProduct_name(job.get("name").toString());
		}*/
		
		/*return new ResponseEntity<String>("success", HttpStatus.OK);*/
	}
	
	@RequestMapping(value="bookingPage.do")
	public ModelAndView bookingPage( Payment payment, ArrayList<Payment> myPmList, ModelAndView mav) {
		//예약 영수증
		
		int re = payService.insertBookingList(payment);
		
		logger.info("re : " + re);
		logger.info("customer: " + payment.getCustomer());
		logger.info("seller_id : " + payment.getSeller_id());
		logger.info("p name : " + payment.getProduct_name());
		logger.info("payment : " + payment);
		
		int payment_no = payment.getPayment_no();
		
		logger.info("payment_no : " + payment_no);
		payment = payService.selectBookingUser(payment);
		logger.info("payment2 : " + payment);
		
		
		mav.addObject("payment", payment);
		mav.setViewName("payment/bookingPage");
		
		return mav;
	}
	
	@RequestMapping(value="resultPay.do")
	public ModelAndView resultList(Payment payment, ModelAndView mav, ArrayList<Payment> pmList) {
		//영수증
		/*payment = payService.selectPaymentListOne(payment);
		logger.info("pament_no : " + payment.getPayment_no());
		
		logger.info("payment : " + payment);
		
		mav.addObject("pmList", payment);*/
		mav.setViewName("payment/paymentPage");
		logger.info("mav pay : " + mav.toString());
		
		return mav;
	}
	@RequestMapping("bookingMsg.do")
	public void bookingMsg() {
		
	}
	 
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
