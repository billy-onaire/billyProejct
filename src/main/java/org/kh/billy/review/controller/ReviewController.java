package org.kh.billy.review.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.kh.billy.member.model.vo.Member;
import org.kh.billy.review.model.service.ReviewService;
import org.kh.billy.review.model.vo.Review;
import org.kh.billy.review.model.vo.ReviewList;
import org.kh.billy.review.model.vo.ReviewPaging;
import org.kh.billy.review.model.vo.ReviewPagingFront;
import org.kh.billy.socialuser.model.vo.SocialUser;
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
	public String reviewListPage(Model model, ReviewPaging paging, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		if(session.getAttribute("loginMember") == null && session.getAttribute("kakaoLogin") == null &&
				session.getAttribute("googleLogin") == null && session.getAttribute("facebookLogin") == null && 
				session.getAttribute("NaverLogin") == null) {
			return "redirect:login.do";
		}else {
			/*SocialUser su = null;
			if(session.getAttribute("loginMember") != null) {
				Member member = (Member)session.getAttribute("loginMember");
				paging.setUserId(member.getUser_id());
			}else if(session.getAttribute("kakaoLogin") != null) {
				su = (SocialUser)session.getAttribute("kakaoLogin");
				paging.setUserId(su.getUser_id());
			}else if(session.getAttribute("googleLogin") != null) {
				su = (SocialUser)session.getAttribute("googleLogin");
				paging.setUserId(su.getUser_id());
			}else if(session.getAttribute("facebookLogin") != null) {
				su = (SocialUser)session.getAttribute("facebookLogin");
				paging.setUserId(su.getUser_id());
			}else if(session.getAttribute("NaverLogin") != null) {
				su = (SocialUser)session.getAttribute("NaverLogin");
				paging.setUserId(su.getUser_id());
			}*/
			List<ReviewList> lists = reviewService.selectListReview(paging);
	        paging.setTotal(reviewService.selectTotalListReview());
	        
	        model.addAttribute("lists", lists);
	        model.addAttribute("p", paging);

			return "member/reviewList";
		}
		/*if(session == null) {
			//return "redirect:login.do";
			System.out.println("세션 없음");
		}else {
			System.out.println("세션 있음"+session);
			System.out.println("loginuser : " + session.getAttribute("loginMember"));
			System.out.println("k : " + session.getAttribute("kakaoLogin"));
			System.out.println("g : " + session.getAttribute("googleLogin"));
			System.out.println("F : " + session.getAttribute("facebookLogin"));
			System.out.println("N : " + session.getAttribute("NaverLogin"));
		}	
		List<ReviewList> lists = reviewService.selectListReview(paging);
        paging.setTotal(reviewService.selectTotalListReview());
        
        model.addAttribute("lists", lists);
        model.addAttribute("p", paging);

		return "member/reviewList";*/
	}
	
	@RequestMapping("writeReview.do")
	public String writeReviewPage(@RequestParam(name="name") String name, @RequestParam(name="img") String img,
			@RequestParam(name="begin") String begin, @RequestParam(name="end") String end, @RequestParam(name="pno") int pNo, 
			@RequestParam(name="payno") String payNo, Model model) {

		model.addAttribute("img", img);
		model.addAttribute("name", name);
		model.addAttribute("begin", begin);
		model.addAttribute("end", end);
		model.addAttribute("pNo", pNo);
		model.addAttribute("payNo", payNo);
		return "member/writeReview";
	}
	
	@RequestMapping(value="insertReview.do", method=RequestMethod.POST)
	public String insertReview(Review review, HttpServletRequest request, @RequestParam(name="img") MultipartFile mphoto) {

		try {
			if(mphoto.getOriginalFilename() != "") {
				String savePath = request.getSession().getServletContext().getRealPath("resources/reviewImg/");
				SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ("yyyyMMddHHmmss");
				Date currentTime = new Date ();
				
				int r = (int)(Math.random()*1000000);		
				String[] type = mphoto.getOriginalFilename().split("\\.");
				String rename = mSimpleDateFormat.format(currentTime) + String.valueOf(r) + "." + type[1];
				review.setReview_image(rename);
					
				mphoto.transferTo(new File(savePath + rename));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		reviewService.insertReview(review);
		
		return "redirect:reviewList.do";
	}
	
	@RequestMapping(value="printReview.do", method=RequestMethod.POST)
	@ResponseBody
	public String printReview(HttpServletResponse response, ReviewPagingFront paging) throws UnsupportedEncodingException {
		
		List<Review> list = reviewService.selectPdetailReview(paging);
		paging.setTotal(reviewService.selectTotalPdetailReview(paging.getProductNo()));
		
		response.setContentType("application/json; charset=utf-8");
		
		JSONObject sendObj = new JSONObject();
		JSONObject pagingObj = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Review r:list) {
			JSONObject jr = new JSONObject();
			
			jr.put("point", r.getPoint());
			jr.put("review_content", URLEncoder.encode(r.getReview_content(), "UTF-8"));
			jr.put("review_date", r.getReview_date().toString());
			jr.put("review_image", r.getReview_image());
			jr.put("review_no", r.getReview_no());
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
