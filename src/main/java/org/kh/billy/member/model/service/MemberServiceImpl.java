package org.kh.billy.member.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.kh.billy.common.MailHandler;
import org.kh.billy.common.TempKey;
import org.kh.billy.member.model.dao.MemberDao;
import org.kh.billy.member.model.vo.BasePage;
import org.kh.billy.member.model.vo.Member;
import org.kh.billy.member.model.vo.Paging;
import org.kh.billy.sms.model.vo.Sms;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
		
	@Autowired
	private SqlSessionTemplate mybatisSession;
			
	@Autowired
	private MemberDao memberDao;
    
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public Member selectCheckId(String userId) {
		return memberDao.selectCheckId(mybatisSession, userId);
	}
	
	@Override
	public Member selectLogin(String userId) {
		return memberDao.selectLogin(mybatisSession, userId);
	}
	
	@Override
	public String selectCheckANo(String userId) {
		return memberDao.selectCheckANo(mybatisSession, userId);
	}
	
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(mybatisSession, member);
	}

	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(mybatisSession, member);
	}

	@Override
	public int deleteMember(String userId) {
		return memberDao.deleteMember(mybatisSession, userId);
	}

	@Override
	public Member selectMember(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Member> searchId(Member member) {
		List<Member> idList = (ArrayList<Member>) memberDao.searchId(mybatisSession, member);
		
		
		return idList;
	
	}
	
	@Transactional
	@Override
	public int create(Member member) throws Exception {
		
		String authkey = new TempKey().getKey(50, false); // 인증키 생성
		member.setAuthkey(authkey);
		int result = memberDao.insertMember(mybatisSession, member); // 회원가입 DAO 인증키 포함저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("billy 서비스 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h3>billy 서비스 메일인증</h3><br>").append("<p>아래 링크를 클릭하여 인증을 완료해주세요</p>")
				.append("<a href='http://localhost:8888/billy/joinConfirm.do?user_id=").append(member.getUser_id())
				.append("&email=").append(member.getEmail()).append("&key=").append(member.getAuthkey()).append("' target='_blenk'><h3>링크 클릭시 인증이 완료되고 홈페이지로 이동합니다.<h3></a>").toString());
		sendMail.setFrom("billy", "billy");
		sendMail.setTo(member.getEmail());
		sendMail.send();
		
		return result;
		
	}
	
	
	
	@Override
	public void deleteAutoNo(String userId) {
		memberDao.deleteAutoNo(mybatisSession, userId);
	}
	
	@Override
	public int insertAuthCode(Sms sms) {
		return memberDao.insertAuthCode(mybatisSession, sms);
	}
	
	@Override
	public int insertSms(Sms sms) {
		return memberDao.insertSms(mybatisSession, sms);
	}
	
	@Override
	public void updateVerify(Member member) {
		memberDao.updateVerify(mybatisSession, member);
	}

	@Override
	public Member selectIdCheck(String userId) {	
		return memberDao.selectIdCheck(mybatisSession, userId);
	}

	@Override
	public int insertSmember(Member member) {
		return memberDao.insertSmember(mybatisSession, member);
	}
	
	@Override
	public int updateMemberPwd(Member member) {
		return memberDao.updateMemberPwd(mybatisSession, member);
	}

	@Override
	public int selectTotalCount() {
		return memberDao.selectTotalCount(mybatisSession);
	}

	@Override
	public int selectSearchTotalCount(String search, String select) {
		return memberDao.selectSearchTotalCount(mybatisSession, search, select);
	}
	
	@Override
	public ArrayList<Member> selectMemberList(BasePage bPage) {
		return memberDao.selectMemberList(mybatisSession, bPage);
	}

	@Override
	public ArrayList<Member> selectSearchMemberList(BasePage bPage, String search, String select) {
		return memberDao.selectSearchMemberList(mybatisSession,bPage,search,select);
	}

	@Override
	public int updateBackMember(String userId) {
		return memberDao.updateBackMember(mybatisSession, userId);
	}

	//탈퇴된 회원 유무
	@Override
	public String selectDeleteUser(String userId) {
		return memberDao.selectDeleteUser(mybatisSession, userId);
	}
	
	@Override
	public int updateSocialMember(Member member) {
		return memberDao.updateSocialMember(mybatisSession, member);
	}

	@Override
	public Member selectSocialMember(Member member) {
		return memberDao.selectSocialMember(mybatisSession, member);
	}

	@Override
	public int deleteUser(String userId) {
		return memberDao.deleteUser(mybatisSession, userId);
	}

	@Override
	public int deleteSuser(String userId) {
		return memberDao.deleteSuser(mybatisSession, userId);
	}
	
	
}
