package org.kh.billy.report.controller;

import javax.servlet.http.HttpServletResponse;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.report.model.service.ReportService;
import org.kh.billy.report.model.vo.Report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	@Autowired
	private ReportService rs;
	
	@RequestMapping("goReport.do")
	public ModelAndView goReportPage(ModelAndView mv, @RequestParam int pno) {
		
		Product p = rs.selectProductForReport(pno);
		System.out.println(p);
		mv.addObject("prod", p);
		mv.setViewName("report/goReport");
		return mv;
	}
	
	@RequestMapping("addReport.do")
	public void insertReport(@RequestBody Report r, HttpServletResponse response) {
		System.out.println(r);
		if(rs.insertReport(r) > 0) {
			System.out.println("저장 테스트 성공");
		}
		
	}
	
}
