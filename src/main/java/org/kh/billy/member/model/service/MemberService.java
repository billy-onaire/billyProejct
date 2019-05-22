package org.kh.billy.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.member.model.vo.BasePage;
import org.kh.billy.member.model.vo.Member;
import org.kh.billy.member.model.vo.Paging;
import org.kh.billy.sms.model.vo.Sms;

public interface MemberService {
	//추상메소드만 멤버로 가짐
			//public abstract 반환형 메소드명(자료형 매개변수);
		Member selectLogin(String userId); 
		Member selectCheckId(String userid);
		int insertMember(Member member);
		int updateMember(Member member);
		int deleteMember(String userId);
		Member selectMember(String userid);
		List<Member> searchId(Member member);
		int create(Member member) throws Exception;
		void updateVerify(Member member);
		Member selectIdCheck(String userId);
		int insertSmember(Member member);
		int insertAuthCode(Sms sms);
		int insertSms(Sms sms);
		String selectCheckANo(String userId);
		void deleteAutoNo(String user_id);
		int updateMemberPwd(Member member);
		int selectTotalCount();
		ArrayList<Member> selectMemberList(BasePage bPage);
		int selectSearchTotalCount(String search, String select);
		ArrayList<Member> selectSearchMemberList(BasePage bPage, String search, String select);
		int updateBackMember(String userId);
		String selectDeleteUser(String userId);
		int updateSocialMember(Member member);
}
