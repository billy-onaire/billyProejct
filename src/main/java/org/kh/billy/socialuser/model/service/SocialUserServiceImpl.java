package org.kh.billy.socialuser.model.service;

import java.util.ArrayList;

import org.kh.billy.member.model.vo.Member;
import org.kh.billy.socialuser.model.dao.SocialUserDao;
import org.kh.billy.socialuser.model.vo.SocialUser;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("socialService")
public class SocialUserServiceImpl implements SocialUserService{

	@Autowired
	private SqlSessionTemplate mSession;
	
	@Autowired
	private SocialUserDao socialDao;
	
	//소셜 탈퇴회원 유무체크
	@Override
	public String selectDeleteSocial(String userId) {
		return socialDao.selectDeleteSocial(mSession, userId);
	}
	
	@Override
	public String selectCheckId(String uid) {
		return socialDao.selectCheckId(mSession, uid);
	}
	
	@Override
	public Member selectUserInfo(String userId) {
		return socialDao.selectUserInfo(mSession, userId);
	}
	
	@Override
	public int selectSocialCheck(String sid) {
		return socialDao.selectSocialCheck(mSession, sid);
	}
	
	@Override
	public int insertSocial(SocialUser social) {
		return socialDao.insertSocial(mSession, social);
	}

	@Override
	public int updateSocial(SocialUser social) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSocial(String userid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public SocialUser selectSocial(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<String> searchId(Member member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectLogin(String uid) {
		// TODO Auto-generated method stub
		return 0;
	}

}
