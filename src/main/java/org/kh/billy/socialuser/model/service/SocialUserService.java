package org.kh.billy.socialuser.model.service;

import java.util.ArrayList;

import org.kh.billy.member.model.vo.Member;
import org.kh.billy.socialuser.model.vo.SocialUser;

public interface SocialUserService {

	int selectLogin(String uid);
    int insertSocial(SocialUser social);
    int updateSocial(SocialUser social);
    int deleteSocial(String userid);
    SocialUser selectSocial(String userid);
    ArrayList<String> searchId(Member member);
	String selectCheckId(String uid);
	int selectSocialCheck(String sid);
	Member selectUserInfo(String userId);
	Member selectDeleteSocial(String userId);
	Member selectSocialUser(String userId);
}
