package org.kh.billy.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
		int currentPage = setting.getPage(); // 현재 페이지
		int listCount =  setting.getListCount(); // 한 페이지에 표시되는 게시물 수
		int totalCount = ps.selectTotalListCount(setting); // 총 게시물 갯수
		int totalPage = totalCount/listCount; // 총 페이지 수
		int countPage = 5; // 페이징 박스 표시 갯수
		
		if(totalCount % listCount > 0) 
			totalPage++; // 총 페이지 수정(올림처리)
		if(currentPage > totalPage)
			setting.setPage(totalPage); // url 변경으로인해 현재페이지가 총 페이지 보다 높을 경우
		
		int startPage = ((currentPage - 1) / 10) * countPage + 1; // 페이징 박스 시작 부분
		int endPage = startPage + countPage - 1; // 페이징 박스 끝 부분
		
		if(endPage > totalPage)
			endPage = totalPage; // 마지막 페이지가 총 페이지보다 많은 경우
		
		int startList = (currentPage - 1) * listCount + 1; // 현재페이지에서 -1을 한 값을 출력되는 갯수와 곱하고 +1을 함.
		int endList = currentPage * listCount; // 현재페이지와 출력되는 갯수의 곱
		
		setting.setTotalCount(totalCount);
		setting.setTotalPage(totalPage);
		setting.setStartPage(startPage);
		setting.setEndPage(endPage);
		setting.setStartList(startList);
		setting.setEndList(endList);
		
		System.out.println(setting);
		ArrayList<ProductForList> list = ps.selectProductList(setting);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		JSONObject sendObj = new JSONObject();
		JSONArray arrJSON = new JSONArray();
		for(ProductForList e: list) {
			JSONObject jo = new JSONObject();
			jo.put("pno", e.getProduct_no());
			jo.put("pname", e.getProduct_name());
			jo.put("price", e.getPrice());
			jo.put("img", e.getFirst_img());
			jo.put("rating", e.getAvg());
			jo.put("date", sdf.format(e.getProduct_date()));
			arrJSON.add(jo);
		}
		JSONObject jp = new JSONObject();
		jp.put("start", startPage);
		jp.put("end", endPage);
		jp.put("currentPage", currentPage);
		jp.put("totalPage", totalPage);
		
		sendObj.put("list", arrJSON);
		sendObj.put("page", jp);
			
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(sendObj.toString());
			out.flush();
			out.close();
	}
}
