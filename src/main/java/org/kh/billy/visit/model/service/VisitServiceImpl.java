package org.kh.billy.visit.model.service;

import org.kh.billy.visit.model.dao.VisitDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public class VisitServiceImpl implements VisitService{

	
	@Autowired
	private SqlSessionTemplate vSession;
	
	@Override
	public int insertVisit() {
		System.out.println("서비스구간임");
		return 0;
	}
	
	
}
