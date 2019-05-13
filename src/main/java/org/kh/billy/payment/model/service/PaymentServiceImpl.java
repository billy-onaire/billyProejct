package org.kh.billy.payment.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.payment.model.dao.PaymentDao;
import org.kh.billy.payment.model.vo.Payment;
import org.kh.billy.payment.model.vo.PaymentPaging;
import org.kh.billy.product.model.vo.Criteria;
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

	@Override
	public ArrayList<Payment> searchPayment(Payment payment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Payment selectPayment(String payment_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPayment(Payment payment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePayment(Payment payment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePayment(String payment_no) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public ArrayList<Payment> selectPaymentMyList() {
		List<Payment> pmList = paymentDao.selectPaymentMyList(mybatisSession);
		return (ArrayList<Payment>)pmList;
	}

	@Override
	public ArrayList<Payment> selectPaymentPList(Criteria cri) {
		
		return paymentDao.selectPaymentPList(mybatisSession, cri);
	}

	@Override
	public int selectPaymentCount(String userId) {

		return paymentDao.selectPaymentCount(mybatisSession, userId);
	}
}
