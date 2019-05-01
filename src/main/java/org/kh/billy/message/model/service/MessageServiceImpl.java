package org.kh.billy.message.model.service;

import java.util.ArrayList;

import org.kh.billy.message.model.dao.MessageDao;
import org.kh.billy.message.model.vo.Message;
import org.kh.billy.product.model.vo.ProductForList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MessageServiceImpl {
	//마이바티스 연동 객체 선언
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	//dao 연동, 자동 연결
	@Autowired
	private MessageDao messageDao;
	
	@Override
	public ArrayList<Message> selectMessageList() {
		
		return (ArrayList<Message>)messageDao.selectMessageList(mybatisSession);
	}
}
