package org.kh.billy.payment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.payment.model.vo.Payment;
import org.kh.billy.payment.model.vo.PaymentCri;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository("paymentDao")
public class PaymentDao {
	private static final Logger logger = LoggerFactory.getLogger(PaymentDao.class);
	private static final String mapper = "paymentMapper.";

	public ArrayList<Payment> selectPaymentList(SqlSessionTemplate mybatisSession) {
		List<Payment> pmList = mybatisSession.selectList("paymentMapper.selectPaymentList");
		return (ArrayList<Payment>)pmList;
	}
	
	public ArrayList<Payment> selectPaymentMyList(SqlSessionTemplate mybatisSession) {
		List<Payment> pmList = mybatisSession.selectList("paymentMapper.selectPaymentMyList");
		return (ArrayList<Payment>)pmList;
	}
	
	public ArrayList<Payment> listCriteria(SqlSessionTemplate mybatisSession, PaymentCri payCri) {
		List<Payment> pmList = mybatisSession.selectList("paymentMapper.listCriteria", payCri);
		return (ArrayList<Payment>)pmList;
	}
	
	public int seachListCount(SqlSessionTemplate mybatisSession, PaymentCri payCri) {
		return mybatisSession.selectOne("paymentMapper.searchListCount", payCri);
	}
	
	public int searchWaitingListCount(SqlSessionTemplate mybatisSession, PaymentCri payCri) {
		return mybatisSession.selectOne("paymentMapper.searchWaitingListCount", payCri);
	}
	
	public ArrayList<Payment> listWaitingCriteria(SqlSessionTemplate mybatisSession, PaymentCri payCri) {
		List<Payment> pmList = mybatisSession.selectList("paymentMapper.listWaitingCriteria", payCri);
		
		return (ArrayList<Payment>)pmList;
	}
	
	public int insertBookingList(SqlSessionTemplate mybatisSession, Payment payment) {
		return mybatisSession.insert(mapper + "insertBookingList", payment);
	}
	
	public Payment selectBookingUser(SqlSessionTemplate mybatisSession, Payment payment) {
		
		return mybatisSession.selectOne(mapper + "selectBookingUser", payment);
	}
	
	public int selectPaymentNo(SqlSessionTemplate mybatisSession, int payment_no) {
		
		return mybatisSession.selectOne(mapper + "selectPaymentNo", payment_no);
	}
	
	public int updateBookingUser(SqlSessionTemplate mybatisSession, Payment payment) {
		
		return mybatisSession.update(mapper + "updateBookingUser", payment);
	}
	
	public Payment selectPaymentListOne(SqlSessionTemplate mybatisSession, int paymentNo) {
		
		return mybatisSession.selectOne(mapper + "selectPaymentListOne", paymentNo);
	}
	
	public int updatePaymentUser(SqlSessionTemplate mybatisSession, int paymentNo) {
		
		return mybatisSession.update(mapper + "updatePaymentUser", paymentNo);
	}
	
	public int updateProductQuantity(SqlSessionTemplate mybatisSession, Payment payment) {
		
		return mybatisSession.update(mapper + "updateProductQuantity", payment);
	}
	
	public int deleteBookingInfo(SqlSessionTemplate mybatisSession, int paymentNo) {
		
		return mybatisSession.delete(mapper + "deleteBookingInfo", paymentNo);
	}
	
	public int updateQuantityAfterCancel(SqlSessionTemplate mybatisSession, Payment payment) {
		
		return mybatisSession.update(mapper + "updateQuantityAfterCancel", payment);
	}
	
	public ArrayList<Payment> chargeListCriteria(SqlSessionTemplate mybatisSession, PaymentCri payCri) {
		List<Payment> pmList = mybatisSession.selectList(mapper + "chargeListCriteria", payCri);
		
		return (ArrayList<Payment>)pmList;
	}
	
	public List<Payment> chargeWaitingListCriteria(SqlSessionTemplate mybatisSession, PaymentCri payCri) {
		List<Payment> pmList = mybatisSession.selectList(mapper + "chargeWaitingListCriteria", payCri);
		
		return (ArrayList<Payment>)pmList;
	}
	
	public int updateAdmitCharge(SqlSessionTemplate mybatisSession, int paymentNo) {
		
		return mybatisSession.update(mapper + "updateAdmitCharge", paymentNo);
	}
	
	public int updateRejectCharge(SqlSessionTemplate mybatisSession, int paymentNo) {
		
		return mybatisSession.update(mapper + "updateRejectCharge", paymentNo);
	}

	public int updateRejectChargeCustomer(SqlSessionTemplate mybatisSession, Payment payment) {
		
		return mybatisSession.update(mapper + "updateRejectChargeCustomer", payment);
	}
}
