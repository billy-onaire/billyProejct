package org.kh.billy.admin.model.service;

import java.util.ArrayList;

import org.kh.billy.admin.model.dao.AdminDao;
import org.kh.billy.visit.model.vo.Visit;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("aService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public ArrayList<Visit> selectLoginVisit(String today) {
		return adao.selectLoginVisit(session, today);
	}

	@Override
	public ArrayList<Integer> selectLoginCount(ArrayList<Visit> visit) {
		return adao.selectLoginCount(session, visit);
	}

}
