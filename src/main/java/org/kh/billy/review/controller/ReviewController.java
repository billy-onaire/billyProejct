package org.kh.billy.review.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.kh.billy.review.model.service.ReviewService;
import org.kh.billy.review.model.vo.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("reviewList.do")
	public String reviewListPage() {
		return "member/reviewList";
	}
	
	@RequestMapping("writeReview.do")
	public String writeReviewPage(@RequestParam(name="payNo") String payNo, Model model) {
		System.out.println("payNo : " + payNo);
		
		model.addAttribute("payNo", payNo);
		return "member/writeReview";
	}
	
	@RequestMapping(value="insertReview.do", method=RequestMethod.POST)
	public String insertReview(Review review, HttpServletRequest request, @RequestParam(name="img") MultipartFile mphoto) {
		//System.out.println("review : " + review);
		String savePath = request.getSession().getServletContext().getRealPath("resources/reviewImg/");
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ("yyyyMMddHHmmss");
		Date currentTime = new Date ();
		
		int r = (int)(Math.random()*1000000);
		
		String[] type = mphoto.getOriginalFilename().split("\\.");
		String rename = mSimpleDateFormat.format(currentTime) + String.valueOf(r) + "." + type[1];

		System.out.println("rename : " + rename);

		review.setReview_image(rename);
		try {
			if(mphoto != null) {
				mphoto.transferTo(new File(savePath + rename));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		reviewService.insertReview(review);
		return "member/reviewList";
	}
}
