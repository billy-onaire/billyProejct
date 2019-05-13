package org.kh.billy.member.model.dao;

import java.util.List;

import org.kh.billy.member.model.vo.Member;
import org.kh.billy.sms.model.vo.Sms;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao {

	public Member selectLogin(SqlSessionTemplate session, String userId) {
		return session.selectOne("memberMapper.selectLogin", userId);
	}
	
	public List<Member> searchId(SqlSessionTemplate session, Member member) {
		return session.selectList("memberMapper.selectMember", member);
	}

	/*public int insertMember(SqlSessionTemplate session, Member member) {
		return session.insert("memberMapper.insertMember", member);
	}*/
	
	public int updateMember(SqlSessionTemplate session, Member member) {
		return session.update("memberMapper.updateMember", member);
	}
	
	public int deleteMember(SqlSessionTemplate session, Member member) {
		return session.update("memberMapper.deleteMember", member);
	}

	public Member selectCheckId(SqlSessionTemplate session, String userId) {
		return session.selectOne("memberMapper.selectCheckId", userId);
	}

	public int insertMember(SqlSessionTemplate session, Member member) {
		return session.insert("memberMapper.insertMember", member);
	}

	public void updateVerify(SqlSessionTemplate session, Member member) {
		session.update("memberMapper.updateVerify", member);
		
	}

	public Member selectIdCheck(SqlSessionTemplate session, String userId) {
		return session.selectOne("memberMapper.selectIdCheck", userId);
	}

	public int insertSmember(SqlSessionTemplate session, Member member) {
		return session.insert("memberMapper.insertSmember", member);
	}

	public int insertAuthCode(SqlSessionTemplate mybatisSession, Sms sms) {
		return 0;
	}

	public int insertSms(SqlSessionTemplate session, Sms sms) {
		return session.insert("memberMapper.insertSms", sms);
	}
	
	public String selectCheckANo(SqlSessionTemplate session, String userId) {
		return session.selectOne("memberMapper.selectCheckANo", userId);
	}

	public void deleteAutoNo(SqlSessionTemplate session, String userId) {
		session.delete("memberMapper.deleteAutoNo", userId);
	}

	public int updateMemberPwd(SqlSessionTemplate session, Member member) {
		return session.update("memberMapper.updateMemberPwd", member);
	}
	
	
}
