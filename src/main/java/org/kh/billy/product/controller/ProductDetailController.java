package org.kh.billy.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductDetailController{
	
	@RequestMapping("pdetail.do")
	public String productDetailPage() {
		return "product/product-details";
	}
}
