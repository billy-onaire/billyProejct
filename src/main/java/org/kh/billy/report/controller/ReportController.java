package org.kh.billy.report.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.report.model.service.ReportService;
import org.kh.billy.report.model.vo.Report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping("checkReport.do")
	public void selectCheckReport(String request_id, HttpServletResponse response) throws IOException{
		int result = rs.selectCheckReport(request_id);
		System.out.println(result);
		if(result == 0) {
			System.out.println("통과");
			PrintWriter out = response.getWriter();
			out.append("ok");
			out.flush();
			out.close();
		}
	}
	@RequestMapping(value = "addReport.do", method = RequestMethod.POST)
	public void insertReport(@RequestBody Report r, HttpServletResponse response) throws IOException {
		System.out.println(r);
		
		int result = rs.insertReport(r);
		System.out.println(result);
		if (result > 0) {
			System.out.println("저장 테스트 성공");
			PrintWriter out = response.getWriter();
			out.append("ok");
			out.flush();
			out.close();
		}

	}

}
