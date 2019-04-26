package org.kh.billy.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.kh.billy.product.model.service.ProductService;
import org.kh.billy.product.model.vo.ProductForList;
import org.kh.billy.product.model.vo.SettingList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService ps;

	@RequestMapping("showlist.do")
	public String goProductListPage() throws IOException {
		
		return "product/product-list";
	}
	
	@RequestMapping(value="getProductList.do", method=RequestMethod.POST)
	public void getProductList(@RequestBody SettingList setting, HttpServletResponse response) throws IOException {
		System.out.println(setting);
		ArrayList<ProductForList> list = ps.selectProductList();
		JSONObject sendObj = new JSONObject();
		JSONArray arrJSON = new JSONArray();
		for(ProductForList e: list) {
			JSONObject jo = new JSONObject();
			jo.put("pno", e.getproduct_no());
			jo.put("pname", e.getProduct_name());
			jo.put("price", e.getPrice());
			jo.put("img", e.getfirst_img());
			
			arrJSON.add(jo);
		}
			sendObj.put("list", arrJSON);
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(sendObj.toString());
			out.flush();
			out.close();
	}
}
