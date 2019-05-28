package org.kh.billy.payment.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.payment.model.dao.PaymentDao;
import org.kh.billy.payment.model.vo.Payment;
import org.kh.billy.payment.model.vo.PaymentCri;
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
	public ArrayList<Payment> listCriteria(PaymentCri payCri) {
		List<Payment> pmList = paymentDao.listCriteria(mybatisSession, payCri);
		return (ArrayList<Payment>)pmList;
	}

	@Override
	public int searchListCount(PaymentCri payCri) {
		
		return paymentDao.seachListCount(mybatisSession, payCri);
	}

	@Override
	public int searchWaitingListCount(PaymentCri payCri) {
		
		return paymentDao.searchWaitingListCount(mybatisSession, payCri);
	}

	@Override
	public ArrayList<Payment> listWatingCriteria(PaymentCri payCri) {
		List<Payment> pmList = paymentDao.listWaitingCriteria(mybatisSession, payCri);
		return (ArrayList<Payment>)pmList;
	}

	@Override
	public int insertBookingList(Payment payment) {
		
		return paymentDao.insertBookingList(mybatisSession, payment);
	}

	@Override
	public Payment selectBookingUser(Payment payment) {
		
		return paymentDao.selectBookingUser(mybatisSession, payment);
	}

	@Override
	public int selectPaymentNo(int payment_no) {
		
		return paymentDao.selectPaymentNo(mybatisSession, payment_no);
	}
 
	@Override
	public int updateBookingUser(Payment payment) {
		
		return paymentDao.updateBookingUser(mybatisSession, payment);
	}
	
	@Override
	public Payment selectPaymentListOne(int paymentNo) {
		
		return paymentDao.selectPaymentListOne(mybatisSession, paymentNo);
	}
	
	@Override
	public int updatePaymentUser(int paymentNo) {
		
		return paymentDao.updatePaymentUser(mybatisSession, paymentNo);
	}
	
	@Override
	public int updateProductQuantity(Payment payment) {
		
		return paymentDao.updateProductQuantity(mybatisSession, payment);
	}
	
	@Override
	public int deleteBookingInfo(int paymentNo) {
		
		return paymentDao.deleteBookingInfo(mybatisSession, paymentNo);
	}
	
	@Override
	public int updateQuantityAfterCancel(Payment payment) {
		
		return paymentDao.updateQuantityAfterCancel(mybatisSession, payment);
	}

	@Override
	public ArrayList<Payment> chargeListCriteria(PaymentCri payCri) {
		List<Payment> pmList = paymentDao.chargeListCriteria(mybatisSession, payCri); 
		
		return (ArrayList<Payment>)pmList;
	}
	@Override
	public ArrayList<Payment >chargeWaitingListCriteria(PaymentCri payCri) {
		List<Payment> pmList = paymentDao.chargeWaitingListCriteria(mybatisSession, payCri);
		
		return (ArrayList<Payment>)pmList;
	}

	@Override
	public int updateAdmitCharge(int paymentNo) {
		
		return paymentDao.updateAdmitCharge(mybatisSession, paymentNo);
	}

	@Override
	public int updateRejectCharge(int paymentNo) {
		
		return paymentDao.updateRejectCharge(mybatisSession, paymentNo);
	}

	@Override
	public int updateRejectChargeCustomer(Payment payment) {
		
		return paymentDao.updateRejectChargeCustomer(mybatisSession, payment);
	}
}
