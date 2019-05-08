package org.kh.billy.payment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.payment.model.vo.Payment;
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
	
	/*public ArrayList<Payment> searchPayment(Payment payment) {}
	
	public Payment selectPayment(String payment_no) {}
	
	public int insertPayment(Payment payment) {}
	
	public int updatePayment(Payment payment) {}
	
	public int deletePayment(String payment_no) {}*/
}
