package org.kh.billy.member.model.dao;

import java.util.List;

import org.kh.billy.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao {

	public List<Member> searchId(SqlSessionTemplate session, Member member) {
		return session.selectList("memberMapper.selectMember", member);
	}
	
}
