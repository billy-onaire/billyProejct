package org.kh.billy.product.controller;

import org.kh.billy.product.model.service.ProductDetailService;
import org.kh.billy.product.model.vo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductDetailController{
	
	@Autowired
	private ProductDetailService pdetailService;
	
	@RequestMapping("pdetail.do")
	public String productDetailPage(Model model, Product product) {
		
		return "product/product-details";
	}
}
