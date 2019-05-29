package org.kh.billy.statistics.model.dao;

import org.kh.billy.statistics.model.vo.Deal;
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
		stSession.insert("statisticsMapper.insertDeal");
	}
	
	public Visit selectLoginVisit(SqlSessionTemplate stSession, String today) {
		return stSession.selectOne("statisticsMapper.selectLoginVisit", today);
	}

	public SignUp selectSignUpCount(SqlSessionTemplate stSession, String today) {
		return stSession.selectOne("statisticsMapper.selectSignUpCount",today);
	}

	public Deal selectDealCount(SqlSessionTemplate stSession, String today) {
		return stSession.selectOne("statisticsMapper.selectDealCount", today);
	}
	
}
