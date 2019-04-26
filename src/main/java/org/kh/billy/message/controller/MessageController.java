package org.kh.billy.message.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kh.billy.message.model.service.MessageService;
import org.kh.billy.message.model.vo.Message;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController {
	
	//해당 클래스와 관련된 로그를 출력 또는 저장하기 위한 로그 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//MemberService에 대한 DI
	@Autowired
	private MessageService memberService;
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginMethod(Message member, HttpSession session, SessionStatus status) {
		
		logger.info("login.do run.");
		Message loginMember = memberService.selectLogin(member);
		//HttpSession session = request.getSession();
		//메소드 매개변수로 선언하면 자동 생성됨
		
		if(loginMember != null) {
		session.setAttribute("loginMember", loginMember);
		/*member.setUsername("홍길동");*/
		status.setComplete();
		
		return "home";
		}else {
			return "common/error";
		}
	}
	
	@RequestMapping("logout.do")
	//value 이름만 지정할 때는 이렇게 써도 된다.
	public String logoutMethod(HttpServletRequest request) {
		logger.info("logout.do run.");
		HttpSession session = request.getSession(false);	//새로 만들지 않게 false라고 써야 한다.
		if(session != null) {
			session.invalidate();
		}
		return "home";
	}
	
	@RequestMapping("enroll.do")
	public String moveEnrollPage() {
		return "member/enroll";
	}
	
	@RequestMapping(value="minsert.do", method=RequestMethod.POST)
	public String insertMember(Model model, Message member, @RequestParam(name="photo", required=false ) MultipartFile mphoto, HttpServletRequest request) {
		/*@RequestParam 어쩌구 이거가  MultipartFile mphoto = new MultipartFile(mrequest.getParameter("photo"))*/
		//syso 대신 logger.info 이용!
		logger.info("member : " + member);
		logger.info("프로필 사진 : " + mphoto);
	/*	System.out.println("member : " + member);
		System.err.println("프로필사진 : " + mphoto);*/
		
		//폴더에 전송 온 파일 저장 처리
		String savePath = request.getSession().getServletContext().getRealPath("resources/files/photo");
		
		try {
			mphoto.transferTo(new File(savePath + "\\" + mphoto.getOriginalFilename()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//패스워드 암호화 처리
		member.setUserpwd(bcryptPasswordEncoder.encode(member.getUserpwd()));
		
		if(memberService.insertMember(member) > 0 ) {
			return "home";
		}else {
			model.addAttribute("message", "회원 가입 실패!");
			return "common/error";
		}
	}
	
	@RequestMapping("myinfo.do")
	public ModelAndView selectMember(ModelAndView mv, /*HttpServletRequest request*/ @RequestParam(name="userid") String userid) {
		//ModelAndView mv = new ModelAndView();
		//String userid = request.getParameter("userid");
		
		logger.info("myinfo.do run.");
		Message member = memberService.selectMember(userid);
		
		mv.addObject("member", member);
		//request.setAttribute("member", member);
		mv.setViewName("member/memberDetailView");
		
		return mv;
	}
	
	@RequestMapping("mdel.do")
	public String memberDelete(Model model, @RequestParam(name="userid") String userid) {
		int result = memberService.deleteMember(userid);
		if(result > 0)
			return "redirect:logout.do";
		else {
			model.addAttribute("message", "회원 탈퇴 실패!");
			return "common/error";
		}
			
	}
	
	@RequestMapping("mupview.do")
	public ModelAndView updateMember(ModelAndView mv, @RequestParam(name="userid") String userid) {
		
		Message member = memberService.selectMember(userid);
		
		if(member != null) {
		mv.addObject("member", member);
		mv.setViewName("member/memberUpdatePage");
		}else {
			mv.addObject("message", "수정할 회원정보 조회 실패!");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="mupdate.do", method=RequestMethod.POST)
	public String updateMember(Message member, Model model) {
		
		//패스워드 암호화 처리
		member.setUserpwd(bcryptPasswordEncoder.encode(member.getUserpwd()));
		
		int result = memberService.updateMember(member);
		
		if(result > 0) {
			return "redirect:myinfo.do?userid=" + member.getUserid();
		}else {
			model.addAttribute("message", "회원정보 수정 실패!");
			return "common/error";
		}
	}
	

	
}
