/*package org.kh.billy.notice.controller;

import java.util.ArrayList;

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
	public void selectNoticeList(Notice notice, NoticePage noticePage) {
		ArrayList<Notice> list = noticeService.selectNoticeList(noticePage); 
	}
	
	@RequestMapping(value="insertNotice.do", method=RequestMethod.POST)
	public String insertNotice(Notice notice) {
		int result = noticeService.insertNotice(notice);
		return null;
	}
	
	@RequestMapping(value="updateNotice.do", method=RequestMethod.POST)
	public String updateNotice(Notice notice) {
		int result = noticeService.updateNotice(notice);
		return null;
	}
	
	@RequestMapping(value="deleteNotice.do", method=RequestMethod.POST)
	public String deleteNotice(Notice notice) {
		int noticeNo = notice.getNotice_no();
		int result = noticeService.deleteNotice(noticeNo);
		return null;
	}
}
*/