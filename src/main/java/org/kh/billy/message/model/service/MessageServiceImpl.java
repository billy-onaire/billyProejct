package org.kh.billy.message.model.service;

import java.util.ArrayList;

import org.kh.billy.message.model.dao.MessageDao;
import org.kh.billy.message.model.vo.Message;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*@Service("memberService")*/
public class MessageServiceImpl {
	/*//마이바티스 연동 객체 선언
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	//dao 연동, 자동 연결
	@Autowired
	private MessageDao memberDao;
	
	@Override
	public Message selectLogin(Message member) {
		// TODO Auto-generated method stub
		return memberDao.selectLogin(mybatisSession, member);
	}

	@Override
	public int insertMember(Message member) {
		int result = memberDao.insertMember(mybatisSession, member);
		if(result > 0) {
			mybatisSession.commit();
		}else
			mybatisSession.rollback();
		return result;
	}

	@Override
	public int updateMember(Message member) {
		return memberDao.updateMember(mybatisSession, member);
	}

	@Override
	public int deleteMember(String userid) {
		return memberDao.deleteMember(mybatisSession, userid);
	}

	@Override
	public ArrayList<Message> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Message selectMember(String userid) {
		return memberDao.selectMember(mybatisSession, userid);
	}*/

}
