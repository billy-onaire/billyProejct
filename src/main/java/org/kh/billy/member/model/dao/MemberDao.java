package org.kh.billy.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kh.billy.member.model.vo.BasePage;
import org.kh.billy.member.model.vo.Member;
import org.kh.billy.member.model.vo.Paging;
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
	
	public int updateMember(SqlSessionTemplate session, Member member) {
		return session.update("memberMapper.updateMember", member);
	}
	
	public int deleteMember(SqlSessionTemplate session, String userId) {
		return session.update("memberMapper.deleteMember", userId);
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

	public int selectTotalCount(SqlSessionTemplate session) {
		return session.selectOne("memberMapper.selectTotalCount");
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate session, BasePage bPage) {
		List<Member> list = session.selectList("memberMapper.selectMemberList", bPage);
		ArrayList<Member> mList = (ArrayList<Member>)list;
		return mList;
	}

	public int selectSearchTotalCount(SqlSessionTemplate session,String search, String select) {
		Map<String, String> map = new HashMap<>();
		if(select.equals("delete_yn")) {
			map.put("select", select);
		}else {
			map.put("search", search);
			map.put("select", select);
		}
		return session.selectOne("memberMapper.selectSearchTotalCount",map);
	}

	public ArrayList<Member> selectSearchMemberList(SqlSessionTemplate session, BasePage bPage, String search,
			String select) {
		Map<String, String> map = new HashMap<>();
		if(select.equals("delete_yn")) {
			map.put("select", select);
		}else {
			map.put("select", select);
			map.put("search", search);
		}
		map.put("rowStart", String.valueOf(bPage.getRowStart()));
		map.put("rowEnd", String.valueOf(bPage.getRowEnd()));
		List<Member> list = session.selectList("memberMapper.selectSearchMemberList",map);
		ArrayList<Member> mList = (ArrayList<Member>)list;
		return mList;
	}

	public int updateBackMember(SqlSessionTemplate session, String userId) {
		return session.update("memberMapper.updateBackMember", userId);
	}

	public String selectDeleteUser(SqlSessionTemplate session, String userId) {
		return session.selectOne("memberMapper.selectDeleteUser", userId);
	}	
}
