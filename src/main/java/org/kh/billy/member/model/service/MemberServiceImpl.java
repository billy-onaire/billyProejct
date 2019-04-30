package org.kh.billy.member.model.service;

import java.util.ArrayList;

import org.kh.billy.member.model.vo.Member;
import org.kh.billy.member.model.dao.MemberDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl {
		
	@Autowired
	private SqlSessionTemplate mybatisSession;
			
	@Autowired
	private MemberDao memberDao;
		
	public ArrayList<String> searchId(Member member){
		ArrayList<Member> idList = (ArrayList<Member>) memberDao.searchId(mybatisSession, member);
		ArrayList<String> idLists = new ArrayList<>();
		for(int i = 0; i < idList.size(); i++) {
			String id = idList.get(i).getUser_id();
			idLists.add(id);
		}
		
		return idLists;
	}
}
