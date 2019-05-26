package org.kh.billy.admin.model.dao;

import org.kh.billy.admin.model.vo.Admin;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adao")
public class AdminDao {

	public void insertAdmin(SqlSessionTemplate session, Admin admin) {
		session.insert("adminMapper.insertAdmin", admin);
	}
	
	public int selectCheckId(SqlSessionTemplate session) {
		return session.selectOne("adminMapper.selectCheckId");
	}

	public Admin selectAdminId(SqlSessionTemplate session, String adminId) {
		return session.selectOne("adminMapper.selectAdminId", adminId);
	}


	
	
}
