package org.kh.billy.payment.controller;

import org.kh.billy.payment.model.service.PaymentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {
	/*private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private PaymentService payService;*/
	
	@RequestMapping("goPayPage.do")
	public String paymentPage() {
		return "payment/paymentPage";
	}

}
