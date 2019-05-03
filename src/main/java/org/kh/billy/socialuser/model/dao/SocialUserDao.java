package org.kh.billy.socialuser.model.dao;

import org.kh.billy.socialuser.model.vo.SocialUser;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("socialUserDao")
public class SocialUserDao {

	public int insertSocial(SqlSessionTemplate mybatisSession, SocialUser social) {		
		return mybatisSession.insert("socialMapper.insertSocial", social);
	}
	
}
