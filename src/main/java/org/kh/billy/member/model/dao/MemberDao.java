package org.kh.billy.member.model.dao;

import java.util.List;

import org.kh.billy.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao {

	public Member selectLogin(SqlSessionTemplate session, Member member) {
		Member loginMember = session.selectOne("memberMapper.selectLogin", member);
		
		return loginMember;
	}
	
	public List<Member> searchId(SqlSessionTemplate session, Member member) {
		return session.selectList("memberMapper.selectMember", member);
	}

	public int insertMember(SqlSessionTemplate session, Member member) {
		return session.insert("memberMapper.insertMember", member);
	}

	public void create(Member member) {
		// TODO Auto-generated method stub
		
	}
	
	public int updateMember(SqlSessionTemplate session, Member member) {
		return session.update("memberMapper.updateMember", member);
	}
	
	public int deleteMember(SqlSessionTemplate session, Member member) {
		return session.update("memberMapper.deleteMember", member);
	}
	
}
