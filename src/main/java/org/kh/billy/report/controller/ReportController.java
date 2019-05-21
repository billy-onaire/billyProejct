package org.kh.billy.report.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.billy.member.model.vo.Member;
import org.kh.billy.product.model.vo.Product;
import org.kh.billy.report.model.service.ReportService;
import org.kh.billy.report.model.vo.Report;
import org.kh.billy.report.model.vo.ReportList;
import org.kh.billy.report.model.vo.ReportSetting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ReportController {
	@Autowired
	private ReportService rs;
	@RequestMapping("reportDisapproval.do")
	public String reportDisapproval(String rno) {
		int result = rs.updateReportDisapporval(rno);
		return "report/adminReport";
	}
	
	@RequestMapping("reportApproval.do")
	public String reportApproval(String rno, String rid) {
		System.out.println(rno);
		int result = rs.updateReportApproval1(rno);
		System.out.println(result);
		int result2 = rs.updateReportApproval2(rid);
		return "report/adminReport";
	}
	@RequestMapping("goReportAdmin.do")
	public String goReportAdminPage() {
		return "report/adminReport";
	}
	
	@RequestMapping(value="getAdminReportInfo.do", method=RequestMethod.POST)
	public void getAdminReportInfo(@RequestBody ReportSetting setting, HttpServletResponse response) throws IOException {
		int currentPage = setting.getPage(); // 현재 페이지
		int listCount =  setting.getListCount(); // 한 페이지에 표시되는 게시물 수
		int totalCount = rs.selectTotalListCount(setting); // 총 게시물 갯수
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
		
		ArrayList<Report> rlist = rs.selectReportList(setting);
		System.out.println(rlist);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		JSONObject send = new JSONObject();
		JSONArray jlist = new JSONArray();
		for(Report r: rlist) {
			JSONObject jo = new JSONObject();
			jo.put("rno", r.getReport_no());
			jo.put("cno", r.getRcategory_no());
			jo.put("content", r.getReport_content());
			jo.put("rdate", sdf.format(r.getReport_date()));
			jo.put("pno", r.getProduct_no());
			jo.put("rid", r.getReport_id());
			jo.put("qid", r.getRequest_id());
			
			jlist.add(jo);
		}
		JSONObject jp = new JSONObject();
		jp.put("start", startPage);
		jp.put("end", endPage);
		jp.put("currentPage", currentPage);
		jp.put("totalPage", totalPage);
		
		send.put("list", jlist);
		send.put("page", jp);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(send.toString());
		out.flush();
		out.close();
	}
	
	@RequestMapping("myReport.do")
	public ModelAndView myReportPage(ModelAndView mv, HttpSession session) {
		Member m = (Member) session.getAttribute("loginMember");
		String user_id = m.getUser_id();
		ArrayList<ReportList> r1 = rs.selectWhatIReport(user_id);
		ArrayList<ReportList> r2 = rs.selectReportedBy(user_id);
		mv.setViewName("report/myReport");
		mv.addObject("mylist", r1);
		mv.addObject("slist", r2);
		return mv;
	}
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
		System.out.println("신고자 아이디 : "+ request_id);
		int result = rs.selectCheckReport(request_id);
		System.out.println(result);
		if(result == 0) {
			PrintWriter out = response.getWriter();
			out.append("ok");
			out.flush();
			out.close();
		}
	}
	@RequestMapping(value = "addReport.do", method = RequestMethod.POST)
	public void insertReport(@RequestBody Report r, HttpServletResponse response) throws IOException {
		
		int result = rs.insertReport(r);
		if (result > 0) {
			System.out.println("저장 테스트 성공");
			PrintWriter out = response.getWriter();
			out.append("ok");
			out.flush();
			out.close();
		}

	}

}
