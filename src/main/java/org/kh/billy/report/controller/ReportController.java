package org.kh.billy.report.controller;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.report.model.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
}
