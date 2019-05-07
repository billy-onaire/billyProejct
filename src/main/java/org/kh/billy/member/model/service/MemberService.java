package org.kh.billy.member.model.service;

import java.util.ArrayList;

import org.kh.billy.member.model.vo.Member;

public interface MemberService {
	//추상메소드만 멤버로 가짐
			//public abstract 반환형 메소드명(자료형 매개변수);
		Member selectLogin(String userId); 
		int insertMember(Member member);
		int updateMember(Member member);
		int deleteMember(String userid);
		Member selectMember(String userid);
		ArrayList<String> searchId(Member member);
		Member selectCheckId(String userId);
		void create(Member member) throws Exception;
		void updateVerify(Member member);
}
