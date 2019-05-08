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
import org.kh.billy.message.model.vo.Message;
import org.kh.billy.message.model.vo.MessagePname;
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
	public ModelAndView selectRecvList(ModelAndView mav) {
		
		ArrayList<MessagePname> list = messageService.selectRecvList();
		
		mav.addObject("recvList",list);
		mav.setViewName("message/messageMain");	
		System.out.println("받은 메세지" + list.toString());		
		return mav; 
	}
		
/*	@RequestMapping(value="recvList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public void selectRecvList(@RequestBody SettingList setting, HttpServletResponse response) throws IOException {
		int currentPage = setting.getPage(); // 현재 페이지
		int listCount =  setting.getListCount(); // 한 페이지에 표시되는 게시물 수
		int totalCount = messageService.selectTotalListCount(setting); // 총 게시물 갯수
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
		ArrayList<Message> list = messageService.selectRecvList(setting);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		JSONObject sendObj = new JSONObject();
		JSONArray arrJSON = new JSONArray();
		for(Message m: list) {
			JSONObject jo = new JSONObject();
			jo.put("mmsno", m.getMms_no());
			jo.put("sentid", m.getSent_id());
			jo.put("content", m.getMms_content());
			jo.put("pno", m.getProduct_no());
			//product_name은 어떻게 가지고 오지?
			jo.put("sentdate", m.getSent_date());
			jo.put("readdate", sdf.format(m.getRead_date()));
			jo.put("read", m.getRecv_read());
			arrJSON.add(jo);
		}
		JSONObject jp = new JSONObject();
		jp.put("start", startPage);
		jp.put("end", endPage);
		jp.put("currentPage", currentPage);
		jp.put("totalPage", totalPage);
		
		sendObj.put("recvList", arrJSON);
		sendObj.put("page", jp);
			
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(sendObj.toString());
			out.flush();
			out.close();
	}*/
	
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
		System.out.println("메세지 번호 : " + message.getMms_no());
		
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
	public ModelAndView updateDelMessage(@RequestParam int mms_no, ModelAndView mv) {
		System.out.println("메세지 삭제 되나요?");
		
		MessagePname m = messageService.updateDelMessage(mms_no);
		mv.addObject("list", m);
		mv.setViewName("message/messageMain");
		System.out.println("메세지 삭제 여부 확인 : " + mms_no);
		
		return mv;
		
	}
	//message 아예 삭제 메소드
	@RequestMapping("deleteMessage.do")
	public void deleteFinalMessage(@RequestParam int mms_no) {
		
		messageService.deleteFinalMessage(mms_no);
		
		
	}
	
	//메세지 복구
	@RequestMapping("messageToOrigin.do")
	public void updateOriginMessage(@RequestParam int mms_no) {
		System.out.println("메세지 복구되나요?");
		messageService.updateDelMessage(mms_no);
		System.out.println("메세지 복구 여부 확인 : " + mms_no);

		
	}
	//페이징처리
	//쪽지 답장
	public String insertReplyMessage(Message message, @RequestParam int mms_no, HttpServletRequest request) {
		
		messageService.insertReplyMessage(message, mms_no);
		
		return "message/messageMain";
	}
	
}
