package org.kh.billy.review.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.kh.billy.review.model.service.ReviewService;
import org.kh.billy.review.model.vo.Review;
import org.kh.billy.review.model.vo.ReviewPaging;
import org.kh.billy.review.model.vo.ReviewPagingFront;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("reviewList.do")
	public String reviewListPage(Model model, ReviewPaging paging) {
		List<Review> lists = reviewService.selectListReview(paging);
        paging.setTotal(reviewService.selectTotalListReview());
        model.addAttribute("lists", lists);
        model.addAttribute("p", paging);

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
	
	@RequestMapping(value="printReview.do", method=RequestMethod.POST)
	@ResponseBody
	public String printReview(HttpServletResponse response, ReviewPagingFront paging) {
		List<Review> list = reviewService.selectPdetailReview(paging);
		paging.setTotal(reviewService.selectTotalPdetailReview());
		
		response.setContentType("application/json; charset=utf-8");
		
		JSONObject sendObj = new JSONObject();
		JSONObject pagingObj = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Review r:list) {
			JSONObject jr = new JSONObject();
			
			jr.put("point", r.getPoint());
			jr.put("review_content", r.getReview_content());
			jr.put("review_date", r.getReview_date().toString());
			jr.put("review_image", r.getReview_image());
			
			jarr.add(jr);
		}
		
		pagingObj.put("pageCnt", paging.getPageCnt());
		pagingObj.put("index", paging.getIndex());
		pagingObj.put("pageStartNum", paging.getPageStartNum());
		pagingObj.put("listCnt", paging.getListCnt());
		pagingObj.put("total", paging.getTotal());
		pagingObj.put("pageLastNum", paging.getPageLastNum());
		pagingObj.put("lastChk", paging.getLastChk());
		pagingObj.put("total", paging.getTotal());
		
		sendObj.put("list", jarr);
		sendObj.put("p", pagingObj);
		
		return sendObj.toJSONString();
		
	}
}
