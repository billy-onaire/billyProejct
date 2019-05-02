package org.kh.billy.payment.controller;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.kh.billy.javaApache.model.request.Cancel;
import org.kh.billy.javaApache.model.request.SubscribeBilling;
import org.kh.billy.payment.model.service.BootpayApi;
import org.kh.billy.payment.model.service.PaymentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

@Controller
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private PaymentService payService;
	
	static BootpayApi api;
	
	@RequestMapping(value="resultPay.do", method=RequestMethod.POST)
	public String resultPay() {
		return "payment/paymentPage";
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
