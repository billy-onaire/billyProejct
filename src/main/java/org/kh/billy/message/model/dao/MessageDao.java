package org.kh.billy.message.model.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.maven.execution.MavenSession;
import org.kh.billy.message.model.vo.CriteriaMms;
import org.kh.billy.message.model.vo.Message;
import org.kh.billy.message.model.vo.MessagePname;
import org.kh.billy.product.model.vo.SettingList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("messageDao")

public class MessageDao {
	
	public int insertMessage(SqlSessionTemplate mybatisSession, MessagePname message) {
		return mybatisSession.insert("messageMapper.insertMessage", message);
	}

	public Message selectMessage(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.selectOne("messageMapper.selectMessage", mms_no);
	}


	public ArrayList<MessagePname> selectRecvList(SqlSessionTemplate mybatisSession, CriteriaMms cri) {
		
		List<MessagePname> list = mybatisSession.selectList("messageMapper.selectRecvList", cri);
		
		return (ArrayList<MessagePname>) list;
	}

	public ArrayList<MessagePname> selectSentList(SqlSessionTemplate mybatisSession, CriteriaMms cri) {
		
		List<MessagePname> list = mybatisSession.selectList("messageMapper.selectSentList", cri);
		
		return (ArrayList<MessagePname>) list;
	}

	public int selectTotalListCount(SqlSessionTemplate mybatisSession, SettingList setting) {
		// TODO Auto-generated method stub
		return mybatisSession.selectOne("messageMapper.selectTotalListCount", setting);
	}

	public int deleteFinalRecv(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.update("messageMapper.deleteFinalRecv", mms_no);
	}
	
	public int deleteFinalSent(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.update("messageMapper.deleteFinalSent", mms_no);
	}


	public int insertReplyMesage(SqlSessionTemplate mybatisSession, MessagePname message) {
		// TODO Auto-generated method stub
		return mybatisSession.insert("messageMapper.insertReplyMessage", message);
	}

	public ArrayList<Message> selectDelList(SqlSessionTemplate mybatisSession, CriteriaMms cri) {
		
		List<Message> list = mybatisSession.selectList("messageMapper.selectDelList", cri);
		
		return (ArrayList<Message>) list;
	}


	public MessagePname selectDetailMessage(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.selectOne("messageMapper.selectDetailMessage", mms_no);
	}

	public int updateOriginRecv(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.update("messageMapper.updateOriginRecv", mms_no);
	}
	
	public int updateOriginSent(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.update("messageMapper.updateOriginSent", mms_no);
	}

	public int selectMessageCount(SqlSessionTemplate mybatisSession, String userId) {
		// TODO Auto-generated method stub
		return mybatisSession.selectOne("messageMapper.selectMessageCount", userId);
		
	}

	public int selectMessageCount2(SqlSessionTemplate mybatisSession, String userId) {
		// TODO Auto-generated method stub
		return mybatisSession.selectOne("messageMapper.selectMessageCount2", userId);
	}

	public int selectMessageCount3(SqlSessionTemplate mybatisSession, String userId) {
		// TODO Auto-generated method stub
		return mybatisSession.selectOne("messageMapper.selectMessageCount3", userId);
	}

	public int updateDelRecvMessage(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.update("messageMapper.updateDelRecvMessage", mms_no);
	}

	public int updateDelSentMessage(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.update("messageMapper.updateDelSentMessage", mms_no);
	}

	public void updateReadRecv(SqlSessionTemplate mybatisSession, int mms_no) {
		mybatisSession.update("messageMapper.updateReadRecv", mms_no);
		
	}

	public MessagePname selectOneMessage(SqlSessionTemplate mybatisSession, int mms_no) {
		// TODO Auto-generated method stub
		return mybatisSession.selectOne("messageMapper.selectDetailMessage", mms_no);
	}

	public int selectUnreadMessage(SqlSessionTemplate mybatisSession, String userid) {
		System.out.println("dao에서 id : " + userid);
		return mybatisSession.selectOne("messageMapper.selectUnreadMessage", userid);
	}

	public ArrayList<MessagePname> selectAlertMessage(SqlSessionTemplate mybatisSession, String userid) {
		
		List<MessagePname> list = mybatisSession.selectList("messageMapper.selectAlertMessage", userid);
		return (ArrayList<MessagePname>) list;
	}

}
