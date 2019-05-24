package org.kh.billy.payment.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.payment.model.dao.PaymentDao;
import org.kh.billy.payment.model.vo.Payment;
import org.kh.billy.payment.model.vo.PaymentCri;
import org.kh.billy.payment.model.vo.PaymentPaging;
import org.kh.billy.payment.model.vo.PaymentSearchCri;
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
	public Payment selectPaymentListOne(Payment payment) {
		
		return paymentDao.selectPaymentListOne(mybatisSession, payment);
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
}
