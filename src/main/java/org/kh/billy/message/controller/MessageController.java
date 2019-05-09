package org.kh.billy.message.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.kh.billy.message.model.service.MessageService;
import org.kh.billy.message.model.vo.CriteriaMms;
import org.kh.billy.message.model.vo.Message;
import org.kh.billy.message.model.vo.MessagePname;
import org.kh.billy.message.model.vo.PageMakerMms;
import org.kh.billy.product.model.vo.Criteria;
import org.kh.billy.product.model.vo.PageMaker;
import org.kh.billy.product.model.vo.Product;
import org.kh.billy.product.model.vo.ProductForList;
import org.kh.billy.product.model.vo.SettingList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;

	@RequestMapping("mmsList.do")
	public String mmsListPage() throws IOException {
		return "message/messageMain";
	}
	
	@RequestMapping("mmsWrite.do")
	public String mmsWritePage() throws IOException{
		return "message/messageWrite";
	}
	
	@RequestMapping(value="recvList.do"/*, method=RequestMethod.POST*/)
	public ModelAndView selectRecvList(ModelAndView mav, CriteriaMms cri) {
		//https://to-dy.tistory.com/90?category=700248 참고
		String userId = "testmk";
		int count = messageService.selectMessageCount(userId);
		PageMakerMms pageMaker = new PageMakerMms();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		cri.setRecv_id(userId);
		System.out.println(cri);
		System.out.println(pageMaker);
			
		System.out.println("받은 메세지 글 수 : " + count);
		
		ArrayList<MessagePname> list = messageService.selectRecvList();
		
		mav.addObject("recvList",list);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("message/messageMain");	
		System.out.println("받은 메세지" + list.toString());
		
		return mav; 
	}
		
	
	@RequestMapping(value="sentList.do"/*, method=RequestMethod.POST*/)
	public ModelAndView selectSentList(ModelAndView mav/*, HttpServletResponse response*//*, @RequestParam(name="user_id") String user_id*/) throws IOException {
		
		ArrayList<MessagePname> list = messageService.selectSentList();
			
		mav.addObject("sentList",list);
		mav.setViewName("message/sentMessage");	
		System.out.println("보낸 메세지" + list.toString());		
		return mav; 
		
	}	
	
	@RequestMapping(value="delList.do"/*, method=RequestMethod.POST*/)
	public ModelAndView selectDelList(ModelAndView mav) {
		
		ArrayList<Message> list = messageService.selectDelList();
		
		mav.addObject("delList", list);
		mav.setViewName("message/delMessage");
		System.out.println("삭제한 메세지" + list.toString());
		
		return mav;
	}
	
	@RequestMapping(value="insertMms.do", method=RequestMethod.POST)
	public String insertMessage(Message message, HttpServletRequest request) {
		
		
		messageService.insertMessage(message);
		//db에는 값이 잘 들어가는데 출력하면 null로 나온당
		System.out.println("작성한 메세지 : " + message);
		
		return "message/messageMain";
	}

	@RequestMapping(value="messageDetail.do")
	public ModelAndView selectDetailMessage(ModelAndView mv, @RequestParam int mms_no) throws Exception{
		
		MessagePname m = messageService.selectDetailMessage(mms_no);
		System.out.println("상세보기 메세지 출력 : " + m);
		mv.addObject("list", m);
		mv.setViewName("message/messageDetail");
		return mv;
	
	}
	
	//message 삭제 메소드
	@RequestMapping("messageToDel.do")
	public ModelAndView updateDelMessage(@RequestParam int mms_no) {
		System.out.println("메세지 삭제 되나요?");
		
		messageService.updateDelMessage(mms_no);
		
//		ModelAndView mv = new ModelAndView("redirect:/mclose.do");
		ModelAndView mv = new ModelAndView("redirect:/mclose.do");
		
		return mv;
	}
	
	@RequestMapping("mclose.do")
	public String close() {
		
		return "message/close";
	}
	
	//message 삭제함에서 삭제
	@RequestMapping("deleteMessage.do")
	public ModelAndView deleteFinalMessage(@RequestParam int mms_no) {
		
		messageService.deleteFinalMessage(mms_no);
		
		ModelAndView mv = new ModelAndView("redirect:/delList.do");
		
		return mv;
	}
	
	//메세지 복구
	@RequestMapping("messageToOrigin.do")
	public ModelAndView updateOriginMessage(@RequestParam int mms_no) {
		
		messageService.updateOriginMessage(mms_no);
		
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
