package org.kh.billy.socialuser.model.service;

import java.util.ArrayList;

import org.kh.billy.member.model.vo.Member;
import org.kh.billy.socialuser.model.vo.SocialUser;
import org.springframework.stereotype.Service;

@Service("socialService")
public class SocialUserServiceImpl implements SocialUserService{

	@Override
	public SocialUser selectLogin(SocialUser social) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertSocial(SocialUser social) {
		// TODO Auto-generated method stub
		return 0;
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

	
}