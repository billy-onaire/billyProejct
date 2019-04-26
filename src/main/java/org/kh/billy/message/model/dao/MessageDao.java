package org.kh.billy.message.model.dao;

import org.kh.billy.message.model.vo.Message;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
//annotation할 때 이름을 지어줄 수 있다, 괄호 안에 넣어주면 됌
public class MessageDao {
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	public Message selectLogin(SqlSessionTemplate session, Message member) {		
		Message loginMember = session.selectOne("memberMapper.selectLogin", member);
		
		//일치하지 않는다면
		if(!bcryptPasswordEncoder.matches(member.getUserpwd(), loginMember.getUserpwd())) {
			loginMember = null;
		}
		return loginMember;
	}

	public int insertMember(SqlSessionTemplate session, Message member) {		
		return session.insert("memberMapper.insertMember", member);
	}

	public Message selectMember(SqlSessionTemplate session, String userid) {
		return session.selectOne("memberMapper.selectMember", userid);
	}

	public int deleteMember(SqlSessionTemplate session, String userid) {
		return session.delete("memberMapper.deleteMember", userid);
	}

	public int updateMember(SqlSessionTemplate session, Message member) {
		return session.update("memberMapper.updateMember", member);
	}

}
