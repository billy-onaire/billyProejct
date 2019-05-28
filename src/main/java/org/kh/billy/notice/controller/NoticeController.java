package org.kh.billy.notice.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("adminnoticelist.do")
	public String selectAdminNoticeList(@RequestParam(defaultValue="") String select, @RequestParam(defaultValue="") String keyword, 
			@RequestParam(defaultValue="1") int curpage, Criteria cri, Notice notice, Model mv) {
		System.out.println("현재 페이지 확인 : " + curpage);
		int count = noticeService.selectSearchNoticeCount(select, keyword);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		cri.setKeyword(keyword);
		cri.setSelect(select);
		if(curpage > 1) {//이 조건이 없으면 현재 page가 계속 1로 고정됨
			cri.setPage(curpage);
		}
		ArrayList<Notice> list = noticeService.selectSearchNoticeList(cri);
		mv.addAttribute("list", list);
		mv.addAttribute("pageMaker", pageMaker);
		mv.addAttribute("keyword", keyword);
		mv.addAttribute("select", select);
		mv.addAttribute("curpage", cri.getPage());
		return "notice/adminNoticeList";
	}
	
	@RequestMapping("noticelist.do")
	public String selectNoticeList(@RequestParam(defaultValue="") String select, @RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curpage, Criteria cri, Notice notice, Model mv) {
		//defaultValue로 처리하면 select나 keyword가 없어도 에러가 뜨지 않음
		int count = noticeService.selectSearchNoticeCount(select, keyword);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		cri.setKeyword(keyword);
		cri.setSelect(select);
		if(curpage > 1) {//이 조건이 없으면 현재 page가 계속 1로 고정됨
			cri.setPage(curpage);
		}
		ArrayList<Notice> list = noticeService.selectSearchNoticeList(cri);
		mv.addAttribute("list", list);
		mv.addAttribute("pageMaker", pageMaker);
		mv.addAttribute("keyword", keyword);
		mv.addAttribute("select", select);
		mv.addAttribute("curpage", cri.getPage());
		return "notice/noticeList";
	}
	
	@RequestMapping("noticefiledown.do")
	public void noticeFileDownload(HttpServletRequest request, HttpServletResponse response, @RequestParam("of") String originalFile, @RequestParam("rf") String renameFile) throws IOException {
		//공지사항 첨부파일 다운로드 
		request.setCharacterEncoding("utf-8");
		
		String path = request.getSession().getServletContext().getRealPath("/resources/files/noticefile");
		
		ServletOutputStream downOut = response.getOutputStream();
		
		File downFile = new File(path + "/" + renameFile);
		
		response.setContentType("text/plain; charset=utf-8");
		response.addHeader("Content-Disposition", "attachment; filename=\"" + new String(originalFile.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		
		BufferedInputStream bin = new BufferedInputStream(new FileInputStream(downFile));
		
		int read = -1;
		while((read = bin.read()) != -1) {
			downOut.write(read);
			downOut.flush();
		}
		downOut.close();
		bin.close();
	}
	@RequestMapping("noticedetail.do")
	public String selectNotice(@RequestParam("notice_no") int noticeNo, Model mv, 
			@RequestParam(defaultValue="") String select, @RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1") int curpage) {
		if(noticeService.updateNoticeReadCount(noticeNo) > 0)
			System.out.println("조회수 1증가");
		else
			System.out.println("조회수 증가 실패");
		Notice notice = noticeService.selectNotice(noticeNo);
		mv.addAttribute("notice", notice);
		mv.addAttribute("select", select);
		mv.addAttribute("keyword", keyword);
		mv.addAttribute("curpage", curpage);
		return "notice/noticeDetail";
	}
	
	@RequestMapping("adminnoticedetail.do")
	public String selectAdminNotice(@RequestParam("notice_no") int noticeNo, Model mv,
			@RequestParam(defaultValue="1") int curpage, @RequestParam(defaultValue="") String select, 
			@RequestParam(defaultValue="") String keyword) {
		//관리자가 상세 조회시 조회수 증가를 시키지 않음
		
		Notice notice = noticeService.selectNotice(noticeNo);
		mv.addAttribute("notice", notice);
		mv.addAttribute("select", select);
		mv.addAttribute("keyword", keyword);
		mv.addAttribute("curpage", curpage);
		return "notice/adminNoticeDetail";
	}
	
	/*@RequestMapping("adminnoticelist.do")
	public String selectAdminNoticeList(Criteria cri, Notice notice, Model mv) {
		
		int count = noticeService.selectNoticeCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(cri);
		mv.addAttribute("list", list);
		mv.addAttribute("pageMaker", pageMaker);
		return "notice/adminNoticeList";
	}*/
	
	/*@RequestMapping("noticelist.do")
	public String selectNoticeList(Criteria cri, Notice notice, Model mv) {
		int count = noticeService.selectNoticeCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(cri);
		mv.addAttribute("list", list);
		mv.addAttribute("pageMaker", pageMaker);
		return "notice/noticeList";
	}*/
	
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
		
		//임의의 admin_id 입력
		notice.setAdmin_id("admin");
		System.out.println("파일 유무 " + file);
		if(!file.getOriginalFilename().equals("")) {
		notice.setNotice_originalfile(file.getOriginalFilename());
		
			try {
				//UUID적용
				String reFileName = uploadFile(file.getOriginalFilename()/*, file.getBytes()*/);
				notice.setNotice_renamefile(reFileName);
				
				file.transferTo(new File(savePath + "\\" + reFileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(noticeService.insertNotice(notice) > 0)
			System.out.println("공지글 작성 완료");
		else
			System.out.println("공지글 작성 실패");
		return "redirect:adminnoticelist.do";
	}
	
	@RequestMapping("noticeupdateview.do")
	public ModelAndView selectNoticeUpdateView(@RequestParam("notice_no") int noticeNo, ModelAndView mv ) {
		//그냥 Notice를 받아오게되면 뒤로가기나 다른 동작들로 인해 꼬일 확률이 높음 그냥 noticeNo를 받아 DB 다녀 옴
		Notice notice = noticeService.selectNotice(noticeNo);
		
		mv.addObject("notice", notice);
		mv.setViewName("notice/noticeUpdate");
		return mv;
	}
	
	@RequestMapping(value="noticeupdate.do", method=RequestMethod.POST)
	public String updateNotice(Notice notice, @RequestParam(name="file")MultipartFile file, HttpServletRequest request) {
		System.out.println(notice);
		//System.out.println("이름 확인 : " + request.getParameter("file"));
		System.out.println("기존 파일 확인 : " + notice.getNotice_originalfile()); 
		System.out.println("기존 파일의 이름 : " + notice.getNotice_renamefile());
		System.out.println("새로 업로드할 파일 이름 : " + file.getOriginalFilename());
		//기존파일 있는지 없는지
		//if(!notice.getNotice_originalfile().equals("")) {
		/*MultipartFile file = (MultipartFile)request.getAttribute("file");*/
		//*RequestParam을 해야 하기 때문에 file을 넘겨받아야 함
		//1.파일을 삭제만 한 경우
		//2.파일을 삭제하고 새 파일을 업로드한 경우
		//3.파일이 없었는데 새로 업로드한 경우
		//4.기존 파일 그대로 냅두는 경우
		//2,3번은 퉁 칠 수 있음.
			
			//제일 쉬운건 그냥 파일이 있든 없든 삭제하고 그 후에 파일 추가 
		File realFile = new File("resources/files/noticefile");
		String savePath = request.getSession().getServletContext().getRealPath("resources/files/noticefile");
		if(!notice.getNotice_originalfile().equals("")) {//기존 파일이 있는 경우
			System.out.println("기존 파일이 있는 경우");
			//파일을 삭제하지 않고 기존파일 그대로 사용
		}else if(file.getOriginalFilename().equals("")) {
			//파일 삭제
			System.out.println("기존 파일이 없고 새 사진도 등록 안한 경우");
			realFile = new File(savePath + "\\" + notice.getNotice_renamefile());
			if(realFile.delete())
				System.out.println("삭제 성공");
			else
				System.out.println("삭제 실패");
			//삭제 후에 DB값 삭제
			notice.setNotice_originalfile(null);
			notice.setNotice_renamefile(null);
		}
		else {//기존 파일이 없는 경우 새 파일 등록
			
			realFile = new File(savePath + "\\" + notice.getNotice_renamefile());
			if(realFile.delete())
				System.out.println("삭제 성공");
			else
				System.out.println("삭제 실패");
			notice.setNotice_originalfile(null);
			notice.setNotice_renamefile(null);
			
			System.out.println("새 파일 등록한 경우");
			
			try {
				//UUID적용
				String reFileName = uploadFile(file.getOriginalFilename()/*, file.getBytes()*/);
				notice.setNotice_originalfile(file.getOriginalFilename());
				notice.setNotice_renamefile(reFileName);
				
				file.transferTo(new File(savePath + "\\" + reFileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		//기존 파일 삭제
		//새 파일 업로드 try-catch문
		//새 파일 업로드 할 경우 새롭게 originfile, renamefile set 해줌
		//기존파일 그대로 사용할 경우 originfile, renamefile 그대로 사용
		//파일 삭제할 경우나 기존 파일이 없을 경우 그대로 냅둠
		
		if(noticeService.updateNotice(notice) > 0)
			System.out.println("수정 성공");
		else
			System.out.println("수정 실패");
		
		
		System.out.println("업데이트 전 notice 확인 : " + notice);
		return "redirect:adminnoticedetail.do?notice_no=" + notice.getNotice_no();
	}
	
	@RequestMapping("deletenotice.do")
	public String deleteNotice(@RequestParam int notice_no, @RequestParam("re") String renameFile,HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/files/noticefile");
		File realFile = new File(savePath + "\\" + renameFile);
		if(realFile.delete())
			System.out.println("파일 삭제 성공");
		else
			System.out.println("파일 삭제 실패");
		//첨부파일 삭제
		System.out.println("삭제 확인 : " + notice_no);
		if(noticeService.deleteNotice(notice_no) > 0)
			System.out.println("글 삭제 성공");
		else
			System.out.println("글 삭제 실패");
		return "redirect:adminnoticelist.do";
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