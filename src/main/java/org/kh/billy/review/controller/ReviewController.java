package org.kh.billy.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReviewController {

	@RequestMapping("reviewList.do")
	public String reviewList() {
		return "member/reviewList";
	}
	
	@RequestMapping("insertReview.do")
	public String insertReview(@RequestParam(name="payNo") String payNo, Model model) {
		System.out.println("payNo : " + payNo);
		
		model.addAttribute("payNo", payNo);
		return "member/insertReview";
	}
}
