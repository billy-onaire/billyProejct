package org.kh.billy.statistics.model.service;

import org.kh.billy.statistics.model.vo.Deal;
import org.kh.billy.statistics.model.vo.SignUp;
import org.kh.billy.statistics.model.vo.Visit;

public interface StatisticsService {

	void insertSignUp();

	void insertDeal();
	
	SignUp selectSignUpCount(String today);

	Visit selectLoginVisit(String today);

	Deal selectDealCount(String today);


}
