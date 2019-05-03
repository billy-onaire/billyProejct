package org.kh.billy.message.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.billy.message.model.service.MessageService;
import org.kh.billy.message.model.vo.Message;
import org.kh.billy.product.model.vo.ProductForList;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView recvList(ModelAndView mav, HttpServletResponse response/*, @RequestParam(name="user_id") String user_id*/) throws IOException {
		
		ArrayList<Message> list = messageService.selectRecvList();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		JSONObject sendObj = new JSONObject();
		JSONArray arrJSON = new JSONArray();
			for(Message mms: list) {
				JSONObject jo = new JSONObject();
				jo.put("mms_no", mms.getMms_no());
				jo.put("sent_id", mms.getSent_id());
				jo.put("mms_content", mms.getMms_content());
				jo.put("sent_date", mms.getSent_date());	//형식 변환 해줘야함
				jo.put("read_date", mms.getRead_date());
				jo.put("recv_read", mms.getRecv_read());
				jo.put("recv_del", mms.getRecv_del());
				jo.put("product_no", mms.getProduct_no());
				arrJSON.add(jo);
			}
			JSONObject jp = new JSONObject();
			
			
			sendObj.put("list", arrJSON);
				
				response.setContentType("application/json; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(sendObj.toString());
				out.flush();
				out.close();
		
		/*mav.addObject("list",list);
		mav.setViewName("message/messageMain");
		
		System.out.println("받은 메세지" + list);*/
		
		return mav; 
		
	}
	
	
	@RequestMapping(value="insertMms.do", method=RequestMethod.POST)
	public String insertMessage(Message message, HttpServletRequest request) {
		System.out.println(message);
		
		messageService.insertMessage(message);
		
		//나중에 productDetail로 변경해야 함/
		return "message/messageMain";
	}
	
	@RequestMapping("detailMms.do")
	public ModelAndView view(@RequestParam int mms_no, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		Message mms = messageService.selectMessage(mms_no);
		
		mav.addObject("mms", mms);
		
		mav.setViewName("message/messageDetail");
		
		return mav;
	}
	
	//message 삭제 메소드
	//message 아예 삭제 메소드
	//메세지 읽음 처리 메소드
	
}
