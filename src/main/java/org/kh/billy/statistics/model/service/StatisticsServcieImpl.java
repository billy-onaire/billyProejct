package org.kh.billy.statistics.model.service;

import java.util.ArrayList;

import org.kh.billy.statistics.model.dao.StatisticsDao;
import org.kh.billy.statistics.model.vo.SignUp;
import org.kh.billy.statistics.model.vo.Visit;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("stService")
public class StatisticsServcieImpl implements StatisticsService{

	@Autowired
	private SqlSessionTemplate stSession;
	
	@Autowired
	private StatisticsDao sdao;

	
	@Override
	public void insertSignUp() {
		sdao.insertSignUp(stSession);
	}
	
	@Override
	public void insertDeal() {
		sdao.insertDeal(stSession);
	}
	
	@Override
	public Visit selectLoginVisit(String today) {
		return sdao.selectLoginVisit(stSession, today);
	}

	@Override
	public SignUp selectSignUpCount(String today) {
		return sdao.selectSignUpCount(stSession, today);
	}

	
	
}
