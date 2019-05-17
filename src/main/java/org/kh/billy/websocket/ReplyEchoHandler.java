package org.kh.billy.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.kh.billy.member.model.vo.Member;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ReplyEchoHandler extends TextWebSocketHandler{
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("afterConnectionEstablished : " + session);
		sessions.add(session);
		String senderId = getId(session);
		
		//연결된 사용자의 아이디
		userSessions.put(senderId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage : " + session + " : " + message);
		//로그인한 유저의 id
		String senderId = getId(session);
/*		for(WebSocketSession sess: sessions) {
			sess.sendMessage(new TextMessage(senderId + ":" + message.getPayload()));
		}*/
		
		//protocol: cmd, 쪽지 보낸 사람, 쪽지 받은 사람, 상품명 (ex : mms, test01, test02, )
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 3) {
				String cmd = strs[0];
				String sent_id = strs[1];
				String recv_id = strs[2];
				String pname = strs[3];
				
				//쪽지 받을 사람이 로그인했을 때
				WebSocketSession recvIdSession = userSessions.get(recv_id);
				if("mms".equals(cmd) && recvIdSession != null) {
					TextMessage tmpMsg = new TextMessage(sent_id + "님이" + pname + "에 문의 메세지를 보냈습니다!");
					recvIdSession.sendMessage(tmpMsg);
				}
			}
		}
			
	}

	private String getId(WebSocketSession session) {
		// httpsession 접근
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member) httpSession.get("loginMember");
		if(null == loginUser)
			return session.getId();
		else
			return loginUser.getUser_id();
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnectionEstablished : " + session + " : " + status);

	}
}
