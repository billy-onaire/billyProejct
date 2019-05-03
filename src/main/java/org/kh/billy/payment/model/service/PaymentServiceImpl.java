package org.kh.billy.payment.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.payment.model.dao.PaymentDao;
import org.kh.billy.payment.model.vo.Payment;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private PaymentDao paymentDao;
	
	@Override
	public ArrayList<Payment> selectPaymentList() {
		List<Payment> pmList = paymentDao.selectPaymentList(mybatisSession);
		return (ArrayList<Payment>)pmList;
	}

}
