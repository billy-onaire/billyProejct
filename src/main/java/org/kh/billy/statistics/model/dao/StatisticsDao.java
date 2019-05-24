package org.kh.billy.statistics.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.statistics.model.vo.SignUp;
import org.kh.billy.statistics.model.vo.Visit;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("sdao")
public class StatisticsDao {

	public void insertSignUp(SqlSessionTemplate stSession) {
		stSession.insert("statisticsMapper.insertSignUp");
	}
	
	public void insertDeal(SqlSessionTemplate stSession) {
		System.out.println("DAO : " + stSession.insert("statisticsMapper.insertDeal"));
		stSession.insert("statisticsMapper.insertDeal");
	}
	
	public Visit selectLoginVisit(SqlSessionTemplate stSession, String today) {
		return stSession.selectOne("statisticsMapper.selectLoginVisit", today);
	}

	public SignUp selectSignUpCount(SqlSessionTemplate stSession, String today) {
		return stSession.selectOne("statisticsMapper.selectSignUpCount",today);
	}
	


	
}
