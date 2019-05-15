package org.kh.billy.websocket;

import org.apache.ibatis.session.SqlSession;
import org.kh.billy.message.model.dao.MessageDao;
import org.kh.billy.message.model.vo.Message;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



@Repository
public class WebsocketHandler extends TextWebSocketHandler {

	

	 @Autowired

		SqlSession sqlsession;

		

		private final Logger logger = LoggerFactory.getLogger(getClass());

		

	  @Override
	// 연결 종료 시(매개변수:WebSocketSession-연결을 끊은 클라이언트, CloseStatus-연결상태)
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

			

		}



	  @Override
	// 접속관련 이벤트함수(매개변수:WebSocketSession-접속한 사용자)
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {

			

		}

	  @Autowired
		private SqlSessionTemplate mybatisSession;
	// send(c to s) emit(s to c) 두 개의 이벤트 처리
	// (매개변수:접속한 사용자, 메시지 내용)
	  @Override

		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

			MessageDao dao = sqlsession.getMapper(MessageDao.class);

			this.logger.info(message.getPayload());

			session.sendMessage(new TextMessage(dao.count_receive_note(mybatisSession, message.getPayload()))); 

	//현재 수신자에게 몇개의 메세지가 와있는지 디비에서 검색함.

			

		}






	}


