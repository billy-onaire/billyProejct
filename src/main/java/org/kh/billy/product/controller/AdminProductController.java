package org.kh.billy.product.controller;

import java.util.List;

import org.kh.billy.product.model.service.AdminProductService;
import org.kh.billy.product.model.vo.Product;
import org.kh.billy.review.model.vo.ReviewPaging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminProductController {

	@Autowired
	private AdminProductService aProductService;
	
	@RequestMapping("adminProductList.do")
	public String adminProductList(Model model, ReviewPaging paging) {
		paging.setListCnt(10);  // 한페이지 출력할 갯수 10
		List<Product> list = aProductService.selectProductList(paging);
		paging.setTotal(aProductService.selectTotalProductList());
		
		model.addAttribute("list", list);
		model.addAttribute("p", paging);
		model.addAttribute("type", "all");
		return "product/adminProduct-list";
	}
	
	@RequestMapping("normalProductList.do")
	public String normalProductList(Model model, ReviewPaging paging) {
		paging.setListCnt(10);  // 한페이지 출력할 갯수 10
		List<Product> list = aProductService.selectNormalProductList(paging);
		paging.setTotal(aProductService.selectTotalNormalProductList());
		
		model.addAttribute("list", list);
		model.addAttribute("p", paging);
		model.addAttribute("type", "normal");
		return "product/adminProduct-list";
	}
	
	@RequestMapping("delProductList.do")
	public String delProductList(Model model, ReviewPaging paging) {
		paging.setListCnt(10);  // 한페이지 출력할 갯수 10
		List<Product> list = aProductService.selectDeleteProductList(paging);
		paging.setTotal(aProductService.selectTotalDeleteProductList());
		
		model.addAttribute("list", list);
		model.addAttribute("p", paging);
		model.addAttribute("type", "del");
		return "product/adminProduct-list";
	}
	
	@RequestMapping("delProduct.do")
	public String deleteProduct(@RequestParam("pno") int pNo, @RequestParam("type") String type) {
		
		aProductService.deleteProduct(pNo);
		
		if(type.equals("all")) {
			return "redirect:adminProductList.do";
		}else if(type.equals("normal")) {
			return "redirect:normalProductList.do";
		}else {
			return "redirect:delProductList.do";			
		}
	}
	
	@RequestMapping("reProduct.do")
	public String restoreProduct(@RequestParam("pno") int pNo, @RequestParam("type") String type) {
		
		aProductService.restoreProduct(pNo);
		
		if(type.equals("all")) {
			return "redirect:adminProductList.do";
		}else if(type.equals("normal")) {
			return "redirect:normalProductList.do";
		}else {
			return "redirect:delProductList.do";			
		}
	}
}
