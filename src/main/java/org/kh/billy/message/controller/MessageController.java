package org.kh.billy.message.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.billy.message.model.service.MessageService;
import org.kh.billy.message.model.vo.Message;
import org.kh.billy.product.model.service.ProductService;
import org.kh.billy.product.model.vo.ProductForList;
import org.kh.billy.product.model.vo.SettingList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MessageController {

	@Autowired
	private MessageService mms;

	@RequestMapping("mmsList.do")
	public String mmsListPage() throws IOException {
		return "message/messageMain";
	}
	

	@RequestMapping(value="getMmsList.do", method=RequestMethod.POST)
	public void getMmsList(@RequestBody SettingList setting, HttpServletResponse response) throws IOException {
		ArrayList<Message> list = mms.selectMessageList();
		JSONObject sendObj = new JSONObject();
		JSONArray arrJSON = new JSONArray();
		for(Message m: list) {
			JSONObject jo = new JSONObject();
			jo.put("mmsno", m.getMms_no());
			jo.put("recvid", m.getRecv_id());
			jo.put("sentid", m.getSent_id());
			jo.put("mmscontent", m.getMms_content());
			jo.put("sentdate", m.getSent_date());
			jo.put("readdate", m.getRead_date());
			jo.put("read", m.getRecv_read());
			jo.put("rdel", m.getRecv_del());
			jo.put("sdel", m.getSent_del());

			
			arrJSON.add(jo);
		}

			sendObj.put("list", arrJSON);
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(sendObj.toString());
			out.flush();
			out.close();
	}	

}
