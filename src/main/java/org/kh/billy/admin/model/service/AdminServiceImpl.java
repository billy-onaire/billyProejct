package org.kh.billy.admin.model.service;

import java.util.ArrayList;

import org.kh.billy.admin.model.dao.AdminDao;
import org.kh.billy.statistics.model.vo.Visit;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("aService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	
}
