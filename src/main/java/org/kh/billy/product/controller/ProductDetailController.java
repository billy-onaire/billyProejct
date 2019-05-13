package org.kh.billy.product.controller;

import org.kh.billy.product.model.service.ProductDetailService;
import org.kh.billy.product.model.vo.ProductDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductDetailController{
	
	@Autowired
	private ProductDetailService pdetailService;
	
	@RequestMapping("pdetail.do")
	public String productDetailPage(Model model, ProductDetail pDetail, @RequestParam(name="pno") int pNo) {
		
		pDetail = pdetailService.selectProductDetail(pNo);
		Double point = pdetailService.selectAvgReview(pNo);
		
		String weekday = pDetail.getWeekday_yn().replace("monday", "월").replace("tuesday", "화").replace("wendsday", "수").replace
				("thursday", "목").replace("friday", "금");
		pDetail.setWeekday_yn(weekday);

		model.addAttribute("p", pDetail);		
		model.addAttribute("point", point);
		return "product/product-details";
	}
}
