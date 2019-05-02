package org.kh.billy.message.model.service;

import java.util.ArrayList;

import org.kh.billy.message.model.dao.MessageDao;
import org.kh.billy.message.model.vo.Message;
import org.kh.billy.product.model.vo.SettingList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("messageService")
public class MessageServiceImpl implements MessageService{
	//마이바티스 연동 객체 선언
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	//dao 연동, 자동 연결
	@Autowired
	private MessageDao messageDao;

	@Override
	public ArrayList<Message> selectMessageList(SettingList setting) {
		// TODO Auto-generated method stub
		return (ArrayList<Message>)messageDao.selectMessageList(mybatisSession);
	}

	@Override
	public int insertMessage(Message message) {

		return messageDao.insertMessage(mybatisSession, message);
		
	}
}
