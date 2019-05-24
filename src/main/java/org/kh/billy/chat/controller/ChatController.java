package org.kh.billy.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.kh.billy.member.model.vo.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@ServerEndpoint(value="/echo.do")
public class ChatController {
	//유저 집합 리스트
    static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
 
    @RequestMapping("chat.do")
	public String chatPage(HttpServletRequest request, Model model) {
    	HttpSession session = request.getSession(false);
    	
    	/*if(session.getAttribute("loginMember") == null) {
    		return "redirect:login.do";
    	}else {
    		model.addAttribute("logimMember", (Member)session.getAttribute("loginMember"));
    		return "chat/chat";
    	}*/
    	model.addAttribute("logimMember", (Member)session.getAttribute("loginMember"));
		return "chat/chat";
	}
    /**
     * 웹 소켓이 접속되면 유저리스트에 세션을 넣는다.
     * @param userSession 웹 소켓 세션
     */
    @OnOpen
    public void handleOpen(Session userSession){
        sessionUsers.add(userSession);
    }
    /**
     * 웹 소켓으로부터 메시지가 오면 호출한다.
     * @param message 메시지
     * @param userSession
     * @throws IOException
     */
    @OnMessage
    public void handleMessage(String message, Session userSession) throws IOException{
        
        for(Session ss : sessionUsers) {
            if(ss != userSession) {
                ss.getBasicRemote().sendText(message);
            }
        }
    }
 
    /**
     * 웹소켓을 닫으면 해당 유저를 유저리스트에서 뺀다.
     * @param userSession
     */
    @OnClose
    public void handleClose(Session userSession){
        sessionUsers.remove(userSession);
    }
	

}
