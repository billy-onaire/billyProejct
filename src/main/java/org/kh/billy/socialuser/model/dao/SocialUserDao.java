package org.kh.billy.socialuser.model.dao;

import org.kh.billy.socialuser.model.vo.SocialUser;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("socialUserDao")
public class SocialUserDao {

	public int insertSocial(SqlSessionTemplate mSession, SocialUser social) {		
		return mSession.insert("socialMapper.insertSocial", social);
	}
	
	public int selectSocialLogin(SqlSessionTemplate mSession, String uid) {
		return mSession.selectOne("socialMapper.selectSocialLogin", uid);
	}

	public String selectCheckId(SqlSessionTemplate mSession, String uid) {
		return mSession.selectOne("socialMapper.selectCheckId", uid);
	}

	public int selectSocialCheck(SqlSessionTemplate mSession, String sid) {
		return mSession.selectOne("socialMapper.selectSocialCheck", sid);
	}
}
