package org.kh.billy.message.model.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.kh.billy.message.model.vo.Message;
import org.kh.billy.message.model.vo.MessagePname;
import org.kh.billy.product.model.vo.SettingList;
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


	public ArrayList<MessagePname> selectRecvList(SqlSessionTemplate mybatisSession) {
		
		List<MessagePname> list = mybatisSession.selectList("messageMapper.selectRecvList");
		
		return (ArrayList<MessagePname>) list;
	}

	public ArrayList<MessagePname> selectSentList(SqlSessionTemplate mybatisSession) {
		
		List<MessagePname> list = mybatisSession.selectList("messageMapper.selectSentList");
		
		return (ArrayList<MessagePname>) list;
	}

	public int selectTotalListCount(SqlSessionTemplate mybatisSession, SettingList setting) {
		// TODO Auto-generated method stub
		return mybatisSession.selectOne("messageMapper.selectTotalListCount", setting);
	}

	public int updateDelMessage(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.update("messageMapper.updateDelMessage", mms_no);
	}

	public int deleteFinalMessage(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.delete("messageMapper.deleteFinalMessage", mms_no);
	}


	public int insertReplyMesage(SqlSessionTemplate mybatisSession, Message message, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.insert("messageMapper.insertReplyMessage", message);
	}

	public ArrayList<Message> selectDelList(SqlSessionTemplate mybatisSession) {
		
		List<Message> list = mybatisSession.selectList("messageMapper.selectDelList");
		
		return (ArrayList<Message>) list;
	}

	public List selectDetailMessage(SqlSessionTemplate mybatisSession, Map param) {
		
		List list = mybatisSession.selectList("messageMapper.selectDetailMessage", param);
		
		return list;
	}

	public void updateReadMessage(SqlSessionTemplate mybatisSession, int mms_no) {
		mybatisSession.update("messageMapper.updateReadMessage", mms_no);
		
	}

	public MessagePname selectDetailMessage(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.selectOne("messageMapper.selectDetailMessage", mms_no);
	}
	

}
