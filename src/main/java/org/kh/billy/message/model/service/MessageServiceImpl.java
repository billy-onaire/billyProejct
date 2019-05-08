package org.kh.billy.message.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.kh.billy.message.model.dao.MessageDao;
import org.kh.billy.message.model.vo.Message;
import org.kh.billy.message.model.vo.MessagePname;
import org.kh.billy.product.model.vo.ProductForList;
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
	public int insertMessage(Message message) {
		return messageDao.insertMessage(mybatisSession, message);
		
	}

	@Override
	public Message selectMessage(int mms_no) {
		return messageDao.selectMessage(mybatisSession, mms_no);
	}

	@Override
	public ArrayList<MessagePname> selectSentList() {
		return (ArrayList<MessagePname>)messageDao.selectSentList(mybatisSession);
	}

	@Override
	public ArrayList<MessagePname> selectRecvList() {
		// TODO Auto-generated method stub
		return (ArrayList<MessagePname>)messageDao.selectRecvList(mybatisSession);
	}

	@Override
	public int deleteFinalMessage(int mms_no) {

		return messageDao.deleteFinalMessage(mybatisSession, mms_no);
		
	}


	@Override
	public int insertReplyMessage(Message message, int mms_no) {
		
		return messageDao.insertReplyMesage(mybatisSession, message, mms_no);
	}

	@Override
	public ArrayList<Message> selectDelList() {
		// TODO Auto-generated method stub
		return messageDao.selectDelList(mybatisSession);
	}


	@Override
	public int selectTotalListCount(SettingList setting) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MessagePname selectDetailMessage(int mms_no) {
		
		messageDao.updateReadMessage(mybatisSession, mms_no);
		
		return messageDao.selectDetailMessage(mybatisSession, mms_no);
	}

	@Override
	public MessagePname updateDelMessage(int mms_no) {
		System.out.println("삭제 업데이트 확인");
		return messageDao.updateDelMessage(mybatisSession, mms_no);
	}



}
