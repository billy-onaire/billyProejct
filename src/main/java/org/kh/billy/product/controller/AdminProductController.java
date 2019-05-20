package org.kh.billy.product.controller;

import java.util.List;

import org.kh.billy.product.model.service.AdminProductService;
import org.kh.billy.product.model.vo.Product;
import org.kh.billy.review.model.vo.ReviewPaging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminProductController {

	@Autowired
	private AdminProductService aProductService;
	
	@RequestMapping("adminProduct.do")
	public String adminProduct(Model model, ReviewPaging paging) {
		List<Product> list = aProductService.selectProductList(paging);
		paging.setTotal(aProductService.selectTotalProductList());
		
		model.addAttribute("list", list);
		model.addAttribute("p", paging);
		return "product/adminProduct-list";
	}
}
