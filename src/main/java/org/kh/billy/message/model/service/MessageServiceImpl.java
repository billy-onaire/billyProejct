package org.kh.billy.message.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.kh.billy.message.model.dao.MessageDao;
import org.kh.billy.message.model.vo.CriteriaMms;
import org.kh.billy.message.model.vo.Message;
import org.kh.billy.message.model.vo.MessagePname;
import org.kh.billy.product.model.vo.ProductForList;
import org.kh.billy.product.model.vo.SettingList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("messageService")
public class MessageServiceImpl implements MessageService{

	@Autowired
	private SqlSessionTemplate mybatisSession;
	

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
	public ArrayList<MessagePname> selectSentList(CriteriaMms cri) {
		return (ArrayList<MessagePname>)messageDao.selectSentList(mybatisSession, cri);
	}

	@Override
	public ArrayList<MessagePname> selectRecvList(CriteriaMms cri) {
		// TODO Auto-generated method stub
		return (ArrayList<MessagePname>)messageDao.selectRecvList(mybatisSession, cri);
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
	public MessagePname selectDetailMessage(int mms_no) {
		
		messageDao.updateReadMessage(mybatisSession, mms_no);
		
		return messageDao.selectDetailMessage(mybatisSession, mms_no);
	}

	@Override
	public int updateDelRecvMessage(int mms_no) {
		System.out.println("출력확인");
		return messageDao.updateDelRecvMessage(mybatisSession, mms_no);
	}
	
	@Override
	public int updateDelSentMessage(int mms_no) {
		System.out.println("출력확인");
		return messageDao.updateDelSentMessage(mybatisSession, mms_no);
	}

	@Override
	public int updateOriginMessage(int mms_no) {
		
		return messageDao.updateOriginMessage(mybatisSession, mms_no);
		
	}

	@Override
	public int selectMessageCount(String userId) {
		// TODO Auto-generated method stub
		return messageDao.selectMessageCount(mybatisSession, userId);
	}

	@Override
	public int selectMessageCount2(String userId) {
		// TODO Auto-generated method stub
		return messageDao.selectMessageCount2(mybatisSession, userId);
	}

	@Override
	public int selectMessageCount3(String userId) {
		// TODO Auto-generated method stub
		return messageDao.selectMessageCount3(mybatisSession, userId);
	}


}
