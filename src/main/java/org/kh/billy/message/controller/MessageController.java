package org.kh.billy.message.controller;


import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kh.billy.member.model.vo.Member;
import org.kh.billy.message.model.service.MessageService;
import org.kh.billy.message.model.vo.CriteriaMms;
import org.kh.billy.message.model.vo.Message;
import org.kh.billy.message.model.vo.MessagePname;
import org.kh.billy.message.model.vo.PageMakerMms;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;

	@RequestMapping("mmsList.do")
	public String mmsListPage() throws IOException {
		return "recvList.do";
	}
	
	@RequestMapping("mmsWrite.do")
	public String mmsWritePage() throws IOException{
		return "message/messageWrite";
	}
	
	@RequestMapping(value="recvList.do"/*, method=RequestMethod.POST*/)
	public ModelAndView selectRecvList(ModelAndView mav, CriteriaMms cri, HttpSession session, HttpServletRequest request/*, @RequestParam(name="userid") String userid*/) {
		//https://to-dy.tistory.com/90?category=700248 참고
		
		Member m = null;
		if(session.getAttribute("loginMember") != null) {
		m = (Member) session.getAttribute("loginMember");
		}else if(session.getAttribute("loginMember") == null && session.getAttribute("googleLogin") != null) {
			System.out.println("구글 로그인멤버 : " +session.getAttribute("googleLogin"));
	          String name = request.getParameter("name");
	          String profile = request.getParameter("profile");
	          System.out.println("name : " + name);
	          System.out.println("profile : " + profile);
		}
		
		System.out.println("로그인멤버 : " + m);
		String userid = "user01";

		int count = messageService.selectMessageCount(userid);
		System.out.println("로그인 아이디 : " + userid);
		PageMakerMms pageMaker = new PageMakerMms();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		cri.setRecv_id(userid);
		System.out.println(cri);
		System.out.println(pageMaker);
			
		System.out.println("받은 메세지 글 수 : " + count);
		
		ArrayList<MessagePname> list = messageService.selectRecvList(cri);
		
		mav.addObject("recvList",list);
		mav.addObject("pageMakerMms", pageMaker);
		mav.setViewName("message/messageMain");	
		System.out.println("받은 메세지" + list.toString());
		
		return mav; 
	}
		
	
	@RequestMapping(value="sentList.do"/*, method=RequestMethod.POST*/)
	public ModelAndView selectSentList(ModelAndView mav, CriteriaMms cri, HttpSession session) {
		
		Member m = null;
		if(session.getAttribute("loginMember") != null) {
		m = (Member) session.getAttribute("loginMember");
		}else if(session.getAttribute("loginMember") == null && session.getAttribute("googleLogin") != null) {
			m = (Member) session.getAttribute("googleLogin");
		}
		System.out.println("로그인멤버 : " + m);
		String userid = m.getUser_id();
		
		int count = messageService.selectMessageCount2(userid);
		
		PageMakerMms pageMaker = new PageMakerMms();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		cri.setSent_id(userid);
		System.out.println(cri);
		System.out.println(pageMaker);
			
		System.out.println("보낸 메세지 글 수 : " + count);
		
		ArrayList<MessagePname> list = messageService.selectSentList(cri);
		System.out.println("보낸 메세지" + list.toString());	
		
		mav.addObject("sentList",list);
		mav.addObject("pageMakerMms", pageMaker);
		mav.setViewName("message/sentMessage");	
		
		
		return mav; 
		
	}	
	
	@RequestMapping(value="delList.do")
	public ModelAndView selectDelList(ModelAndView mav, CriteriaMms cri, HttpSession session) {
		Member m = (Member) session.getAttribute("loginMember");
		System.out.println("로그인멤버 : " + m);
		String userid = m.getUser_id();
		
		int count = messageService.selectMessageCount3(userid);
		
		
		PageMakerMms pageMaker = new PageMakerMms();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		cri.setSent_id(userid);
		cri.setRecv_id(userid);
		
		System.out.println(cri);
		System.out.println(pageMaker);
			
		System.out.println("삭제된 메세지 글 수 : " + count);
		
		ArrayList<Message> list = messageService.selectDelList(cri);
		
		mav.addObject("delList", list);
		mav.addObject("pageMakerMms", pageMaker);
		mav.setViewName("message/delMessage");
		System.out.println("삭제한 메세지" + list.toString());
		
		return mav;
	}
	
	@RequestMapping(value="insertMms.do", method=RequestMethod.POST)
	public ModelAndView insertMessage(Message message, HttpSession session) {
		
		
		//session에서 userid 받아오기
		Member m = (Member) session.getAttribute("loginMember");
		System.out.println("로그인멤버 : " + m);
		String userid = m.getUser_id();
		System.out.println("userid");
		message.setSent_id(userid);
		messageService.insertMessage(message);
		//db에는 값이 잘 들어가는데 출력하면 null로 나온당
		System.out.println("작성한 메세지 : " + message);
		ModelAndView mv = new ModelAndView("redirect:/recvList.do");
		
		return mv;
	}

	@RequestMapping(value="messageDetail.do")
	public ModelAndView selectDetailMessage(ModelAndView mv, @RequestParam int mms_no, HttpSession session) throws Exception{
		
		Member mem = (Member) session.getAttribute("loginMember");
		System.out.println("로그인멤버 : " + mem);
		String userid = mem.getUser_id();
		System.out.println("id : " + userid);
		
		MessagePname m = null;
		
		m = messageService.selectDetailMessage(mms_no, userid);
		System.out.println("no : " +  mms_no);
		System.out.println("아이디 : " + m.getRecv_id());


		System.out.println("상세보기 메세지 출력 : " + m);
		mv.addObject("list", m);
		mv.setViewName("message/messageDetail");
		return mv;
	
	}
	
	//받은 메세지 삭제함으로
	@RequestMapping("messageToDelRecv.do")
	public ModelAndView updateDelRecvMessage(@RequestParam int mms_no) {
		System.out.println("메세지 삭제 되나요?");
		
		messageService.updateDelRecvMessage(mms_no);
		
		ModelAndView mv = new ModelAndView("redirect:/mclose.do");
		
		return mv;
	}
	
	//보낸 메세지 삭제함으로
	@RequestMapping("messageToDelSent.do")
	public ModelAndView updateDelSentMessage(@RequestParam int mms_no) {
		System.out.println("메세지 삭제 되나요?");
		
		messageService.updateDelSentMessage(mms_no);
		
		ModelAndView mv = new ModelAndView("redirect:/mclose.do");
		
		return mv;
	}
	
	//가짜 페이지
	@RequestMapping("mclose.do")
	public String close() {
		
		return "message/close";
	}
	
	//받은 삭제 메세지 삭제함에서 삭제
	@RequestMapping("deleteMessage.do")
	public ModelAndView deleteFinalMessage(@RequestParam int mms_no, HttpSession session) {
		Member mem = (Member) session.getAttribute("loginMember");
		System.out.println("로그인멤버 : " + mem);
		String userid = mem.getUser_id();
		System.out.println("id : " + userid);
		
		MessagePname m = null;
		
		messageService.deleteFinalMessage(mms_no, userid);
		
		ModelAndView mv = new ModelAndView("redirect:/delList.do");
		
		return mv;
	}
	
	//메세지 복구
	@RequestMapping("messageToOrigin.do")
	public ModelAndView updateOriginMessage(@RequestParam int mms_no, HttpSession session) {
		Member mem = (Member) session.getAttribute("loginMember");
		System.out.println("로그인멤버 : " + mem);
		String userid = mem.getUser_id();
		System.out.println("id : " + userid);
		
		MessagePname m = null;
		messageService.updateOriginMessage(mms_no, userid);
		
		ModelAndView mv = new ModelAndView("redirect:/delList.do");
		
		return mv;

		
	}
	//페이징처리
	//쪽지 답장
	public String insertReplyMessage(Message message, @RequestParam int mms_no, HttpServletRequest request) {
		
		messageService.insertReplyMessage(message, mms_no);
		
		return "message/messageMain";
	}
	

	
}
