package org.kh.billy.payment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.payment.model.vo.Payment;
import org.kh.billy.payment.model.vo.PaymentCri;
import org.kh.billy.payment.model.vo.PaymentPaging;
import org.kh.billy.payment.model.vo.PaymentSearchCri;
import org.kh.billy.product.model.vo.SettingList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("paymentDao")
public class PaymentDao {

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
		return mybatisSession.insert("paymentMapper.insertBookingList", payment);
	}
	public Payment selectBookingUser(SqlSessionTemplate mybatisSession, String customer) {
		
		return mybatisSession.selectOne("paymentMapper.selectBookingUser", customer);
	}
	
	/*public ArrayList<Payment> searchPayment(Payment payment) {}
	
	public Payment selectPayment(String payment_no) {}
	
	public int insertPayment(Payment payment) {}
	
	public int updatePayment(Payment payment) {}
	
	public int deletePayment(String payment_no) {}*/
}
