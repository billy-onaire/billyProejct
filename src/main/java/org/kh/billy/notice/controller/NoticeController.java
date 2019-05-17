package org.kh.billy.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.kh.billy.member.model.vo.Member;
import org.kh.billy.notice.model.service.NoticeService;
import org.kh.billy.notice.model.vo.Notice;
import org.kh.billy.notice.model.vo.NoticePage;
import org.kh.billy.product.model.vo.Criteria;
import org.kh.billy.product.model.vo.PageMaker;
import org.kh.billy.product.model.vo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("selectnoticelist.do")
	public String selectNoticeList(Criteria cri, Notice notice, Model mv) {
		//ArrayList<Notice> list = noticeService.selectNoticeList(noticePage);
		System.out.println("공지 리스트 확인용");
		
		//String userId = ((Member) session.getAttribute("loginMember")).getUser_id();
		
		int count = noticeService.selectNoticeCount();
		System.out.println("공지사항 갯수 : " + count);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		//cri.setSeller_id(userId);
		//System.out.println(cri);
		//System.out.println(pageMaker);
		/*System.out.println(member);*/
		/*String userId = member.getUser_id();*/
		
		//System.out.println("메스드는 들어가지는지?");
		
		ArrayList<Notice> list = noticeService.selectNoticeList(cri);
		//System.out.println("리스트 확인 : " + list);
		mv.addAttribute("list", list);
		mv.addAttribute("pageMaker", pageMaker);
		return "notice/noticeList";
	}
	
	@RequestMapping("noticewriteview.do")
	public String noticeWriteView(Notice notice) {
		//int result = noticeService.insertNotice(notice);
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="insertnotice.do", method=RequestMethod.POST)
	public String insertNotice(Notice notice, HttpServletRequest request,   @RequestParam(name="file")MultipartFile file)  {
		//int result = noticeService.insertNotice(notice);
		System.out.println("오리지날 네임 : " + file.getOriginalFilename());
		
		System.out.println("네이버 내용 확인 : " + request.getParameter("notice_content"));
		System.out.println("내용2" + notice.getNotice_content());
		System.out.println("내용확인 : "+request.getParameter("editordata"));
		
		
		//String reFileName = noticefile.getOriginalFilename();
		//System.out.println("파일이름 확인 : " + reFileName);
		String savePath = request.getSession().getServletContext().getRealPath("resources/files/noticefile");
		//noticefile.transferTo(new File(savePath + "\\" + reFileName));
		//noticefile.transferTo(new File("\\billy\\resources\\files\\notice" + "\\" + reFileName));
		
		//String savePath = request.getSession().getServletContext().getRealPath("resources/files/noticefile");
		
		
		notice.setNotice_originalfile(file.getOriginalFilename());
		try {
			//UUID적용
			String reFileName = uploadFile(file.getOriginalFilename()/*, file.getBytes()*/);
			notice.setNotice_renamefile(reFileName);
			
			//임의의 admin_id 입력
			notice.setAdmin_id("admin");
			
			if(noticeService.insertNotice(notice) > 0)
				System.out.println("공지글 작성 완료");
			else
				System.out.println("공지글 작성 실패");
			
			file.transferTo(new File(savePath + "\\" + reFileName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "home";
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
	
	private String uploadFile(String originalName/*, byte[] fileData*/) throws IOException {
		//uuid 생성(Universal Unique IDentifier, 범용 교유 식별자)
		UUID uuid = UUID.randomUUID();
		//랜덤 생성 + 파일이름 저장
		String reFileName = uuid.toString() + "_" + originalName;
		//File target = new File("/billy/resources/files/notice",reFileName);
		//임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		//FileCopyUtils.copy(바이트배열, 파일객체)
		//FileCopyUtils.copy(fileData, target);
		return reFileName;
				
	}
}