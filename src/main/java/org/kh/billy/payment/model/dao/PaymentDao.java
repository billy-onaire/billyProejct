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
	public ArrayList<Payment> selectPaymentPList(SqlSessionTemplate mybatisSession, PaymentCri cri) {
		List<Payment> pmList = mybatisSession.selectList("paymentMapper.selectPaymentPList", cri);
		return (ArrayList<Payment>)pmList;
	}
	public int selectPaymentCount(SqlSessionTemplate mybatisSession, String userId) {
		return mybatisSession.selectOne("paymentMapper.selectPaymentCount", userId);
	}
	public ArrayList<Payment> listCriteria(SqlSessionTemplate mybatisSession, PaymentSearchCri payCri) {
		List<Payment> pmList = mybatisSession.selectList("paymentMapper.listCriteria", payCri);
		return (ArrayList<Payment>)pmList;
	}
	public int seachListCount(SqlSessionTemplate mybatisSession, PaymentSearchCri payCri) {
		return mybatisSession.selectOne("paymentMapper.searchListCount", payCri);
	}
	
	/*public ArrayList<Payment> searchPayment(Payment payment) {}
	
	public Payment selectPayment(String payment_no) {}
	
	public int insertPayment(Payment payment) {}
	
	public int updatePayment(Payment payment) {}
	
	public int deletePayment(String payment_no) {}*/
}
