package org.kh.billy.visit.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class VisitDao	 {
	
	public int insertVisit(SqlSessionTemplate vSession){
		return vSession.insert("visitMapper.insertVisit");
	}

}
