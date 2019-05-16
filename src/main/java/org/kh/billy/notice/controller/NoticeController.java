package org.kh.billy.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.billy.notice.model.service.NoticeService;
import org.kh.billy.notice.model.vo.Notice;
import org.kh.billy.notice.model.vo.NoticePage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("selectnoticelist.do")
	public String selectNoticeList(Notice notice, NoticePage noticePage) {
		ArrayList<Notice> list = noticeService.selectNoticeList(noticePage);
		System.out.println("공지 리스트 확인용");
		return "notice/noticeList";
	}
	
	@RequestMapping("noticewriteview.do")
	public String noticeWriteView(Notice notice) {
		//int result = noticeService.insertNotice(notice);
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="insertnotice.do", method=RequestMethod.POST)
	public String insertNotice(Notice notice, HttpServletRequest request) {
		//int result = noticeService.insertNotice(notice);
		System.out.println("네이버 내용 확인 : " + request.getParameter("ir1"));
		System.out.println("내용확인 : "+request.getParameter("editordata"));
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="updatenotice.do", method=RequestMethod.POST)
	public String updateNotice(Notice notice) {
		int result = noticeService.updateNotice(notice);
		return null;
	}
	
	@RequestMapping(value="deletenotice.do", method=RequestMethod.POST)
	public String deleteNotice(Notice notice) {
		int noticeNo = notice.getNotice_no();
		int result = noticeService.deleteNotice(noticeNo);
		return null;
	}
}