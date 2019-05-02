package org.kh.billy.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	
	@RequestMapping("goReport.do")
	public ModelAndView goReportPage(ModelAndView mv, @RequestParam int product_no) {
		mv.setViewName("report/goReport");
		return mv;
	}
	
}
