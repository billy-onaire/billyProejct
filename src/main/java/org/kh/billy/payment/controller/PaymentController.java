package org.kh.billy.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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
import org.kh.billy.payment.model.vo.PaymentPaging;
import org.kh.billy.product.model.vo.Criteria;
import org.kh.billy.product.model.vo.PageMaker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value="paylist.do")
	public ModelAndView paymentMyList(Criteria cri, ModelAndView model) {
		String userId = "superje";
		int count = payService.selectPaymentCount(userId);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		cri.setSeller_id(userId);
		
		ArrayList<Payment> plist = payService.selectPaymentPList(cri);
		model.addObject("pmList", plist);
		model.addObject("pageMaker", pageMaker);
		model.setViewName("payment/paylistMypage");
		
		return model;
		
	}
	/*(@RequestParam(name="pageCount") String pageCount, 
			@RequestBody PaymentPaging setting, ArrayList<Payment> plist, HttpServletResponse response) throws IOException {
		int currentPage = setting.getPage();
		int listCount = setting.getListCount();
		int totalCount = payService.selectTotalListCount(setting);
		
		int totalPage = totalCount/listCount;
		int countPage = Integer.parseInt(pageCount); //페이징 개수
		
		if(totalCount % listCount > 0)
			totalPage++;
		if(currentPage > totalPage)
			setting.setPage(totalPage);
		
		int startPage = ((currentPage - 1)/10) * countPage + 1;
		int endPage = startPage + countPage - 1;
		
		if(endPage > totalPage)
			endPage = totalPage;
		
		int startList = (currentPage - 1)*listCount + 1;
		int endList = currentPage * listCount;
		
		setting.setTotalCount(totalCount);
		setting.setTotalPage(totalPage);
		setting.setStartPage(startPage);
		setting.setEndPage(endPage);
		setting.setStartList(startList);
		setting.setEndPage(endPage);
		logger.info("setting : " + setting);
		
		plist = payService.selectPaymentList(setting);
		JSONObject job = new JSONObject();
		JSONArray jar = new JSONArray();
		for(Payment p : plist) {
			JSONObject ob = new JSONObject();
			ob.put("booking_no", p.getBooking_no());
			ob.put("product_name", p.getProduct_name());
			ob.put("seller_id", p.getSeller_id());
			ob.put("status", p.getStatus());
			
			jar.add(ob);
		}
		JSONObject pagingJson = new JSONObject();
		pagingJson.put("start", startPage);
		pagingJson.put("end", endPage);
		pagingJson.put("currentPage", currentPage);
		pagingJson.put("totalPage", totalPage);
		
		job.put("plist", jar);
		job.put("page", pagingJson);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(job.toString());
		out.flush();
		out.close();
	}*/
	/*public void payList(ArrayList<Payment> pmList, ModelAndView mav, HttpServletResponse response) throws IOException {
		pmList = payService.selectPaymentMyList();
		
		JSONObject job = new JSONObject();
		JSONArray jar = new JSONArray();
		
		for(Payment p : pmList) {
			JSONObject ob = new JSONObject();
			ob.put("booking_no", p.getBooking_no());
			ob.put("seller_id", p.getSeller_id());
			try {
				ob.put("pStatus", URLEncoder.encode(p.getStatus(), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			jar.add(ob);
		}
		job.put("pmList", jar);
		logger.info("mav payMylist : " + jar.toJSONString());
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(jar.toJSONString());
		out.flush();
		out.close();
	}*/
	
	@RequestMapping(value="bookingPage.do")
	public String paymentMyList(Payment payment, ArrayList<Payment> myPmList) {
		
		return "payment/bookingPage";
	}
	
	@RequestMapping(value="resultPay.do")
	public ModelAndView resultList(Payment payment, ModelAndView mav, ArrayList<Payment> pmList) {
		 pmList = payService.selectPaymentList();
		logger.info("payment : " + payment);
		
		mav.addObject("pmList", pmList);
		mav.setViewName("payment/paymentPage");
		logger.info("mav pay : " + mav.toString());
		
		return mav;
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
