package org.kh.billy.member.model.service;

import java.util.ArrayList;

import org.kh.billy.member.model.vo.Member;
import org.kh.billy.member.model.dao.MemberDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
		
	@Autowired
	private SqlSessionTemplate mybatisSession;
			
	@Autowired
	private MemberDao memberDao;
    
	/*@Autowired
	private JavaMailSender mailSender;*/
	
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
	
	@Override
	public void create(Member member) {
		
	}
	/*@Override
	public void create(Member member) {
		memberDao.create(member);
		
		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(50, false);

		member.setAuthkey(authkey);
		uDAO.updateAuthkey(uVO);

		// mail 작성 관련 
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[Hoon's Board v2.0] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8080/user/joinConfirm?uid=")
				.append(uVO.getUid())
				.append("&email=")
				.append(uVO.getEmail())
				.append("&authkey=")
				.append(authkey)
				.append("' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("관리자 ", "관리자명");
		sendMail.setTo(uVO.getEmail());
		sendMail.send();
	}*/
	
}
