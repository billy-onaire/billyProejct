package org.kh.billy.member.model.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.kh.billy.common.MailHandler;
import org.kh.billy.common.TempKey;
import org.kh.billy.member.model.dao.MemberDao;
import org.kh.billy.member.model.vo.Member;
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
	public int insertMember(Member member) {
		return memberDao.insertMember(mybatisSession, member);
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member selectMember(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<String> searchId(Member member) {
		ArrayList<Member> idList = (ArrayList<Member>) memberDao.searchId(mybatisSession, member);
		ArrayList<String> idLists = new ArrayList<>();
		for(int i = 0; i < idList.size(); i++) {
			String id = idList.get(i).getUser_id();
			idLists.add(id);
		}
		
		return idLists;
	
	}
	
	@Transactional
	@Override
	public int create(Member member) throws Exception {
		
		String authkey = new TempKey().getKey(50, false); // 인증키 생성
		member.setAuthkey(authkey);
		int result = memberDao.insertMember(mybatisSession, member); // 회원가입 DAO 인증키 포함저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("billy 서비스 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h2>billy 서비스 메일인증</h2><br><br>")
				.append("<a href='http://localhost:8888/billy/joinConfirm.do?user_id=").append(member.getUser_id())
				.append("&email=").append(member.getEmail()).append("&key=").append(member.getAuthkey()).append("' target='_blenk'><h2>서비스 이용을 위해 링크를 눌러 이메일 인증을 완료해주세요.<h2></a>").toString());
		sendMail.setFrom("billy", "billy");
		sendMail.setTo(member.getEmail());
		sendMail.send();
		
		return result;
		
	}

	@Override
	public void updateVerify(Member member) {
		memberDao.updateVerify(mybatisSession, member);
		
	}

	@Override
	public Member selectIdCheck(String userId) {	
		return memberDao.selectIdCheck(mybatisSession, userId);
	}	
}
