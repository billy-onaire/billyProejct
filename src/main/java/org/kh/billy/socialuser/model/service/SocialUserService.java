package org.kh.billy.socialuser.model.service;

import java.util.ArrayList;

import org.kh.billy.member.model.vo.Member;
import org.kh.billy.socialuser.model.vo.SocialUser;

public interface SocialUserService {

	SocialUser selectLogin(SocialUser social); 
    int insertSocial(SocialUser social);
    int updateSocial(SocialUser social);
    int deleteSocial(String userid);
    SocialUser selectSocial(String userid);
    ArrayList<String> searchId(Member member);
}
