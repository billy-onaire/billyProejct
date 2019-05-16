package org.kh.billy.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.kh.billy.javaApache.model.request.Cancel;
import org.kh.billy.javaApache.model.request.SubscribeBilling;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@Controller
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
	public ModelAndView paymentWaiting(PaymentCri payCri, ModelAndView mav) {
		//결제대기 내역
		PaymentPageMaker pageMaker = new PaymentPageMaker(payCri);
		pageMaker.setTotalCount(payService.searchWaitingListCount(payCri));
		
		mav.addObject("pmList", payService.listWatingCriteria(payCri));
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("payment/paymentWaiting");
		
		return mav;
	}
	@RequestMapping("doPayment.do")
	public void doPayment(Payment payment, HttpServletResponse response) throws IOException {
		JSONObject job = new JSONObject();
		
		job.put("price", payment.getPayment_price());
		
		PrintWriter pw = response.getWriter();
		pw.println(job.toJSONString());
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value="bookingPage.do")
	public ModelAndView bookingPage(@RequestParam(name="customer") String customer, Payment payment, ArrayList<Payment> myPmList, ModelAndView mav) {
		//예약 영수증
		//requestparam으로 customer 꺼내오기. 아직 로그인 못하니까 나중에
		payment.setCustomer(customer);
		int re = payService.insertBookingList(payment);
		System.out.println("re : " + re);
		System.out.println("customer: " + customer);
		payment = payService.selectBookingUser(customer);
		System.out.println("payment : " + payment);
		
		mav.addObject("payment", payment);
		mav.setViewName("payment/bookingPage");
		
		return mav;
	}
	
	@RequestMapping(value="resultPay.do")
	public ModelAndView resultList(Payment payment, ModelAndView mav, ArrayList<Payment> pmList) {
		//영수증
		pmList = payService.selectPaymentList();
		logger.info("payment : " + payment);
		
		mav.addObject("pmList", pmList);
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
