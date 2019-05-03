package org.kh.billy.message.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.kh.billy.message.model.vo.Message;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("messageDao")
//annotation할 때 이름을 지어줄 수 있다, 괄호 안에 넣어주면 됌
public class MessageDao {
	
	public int insertMessage(SqlSessionTemplate mybatisSession, Message message) {
		return mybatisSession.insert("messageMapper.insertMessage", message);
	}

	public Message selectMessage(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.selectOne("messageMapper.selectMessage", mms_no);
	}


	public ArrayList<Message> selectRecvList(SqlSessionTemplate mybatisSession) {
		
		List<Message> list = mybatisSession.selectList("messageMapper.selectRecvList");
		
		return (ArrayList<Message>) list;
	}
}
