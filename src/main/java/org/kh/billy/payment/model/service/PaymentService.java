package org.kh.billy.payment.model.service;

import java.util.ArrayList;

import org.kh.billy.payment.model.vo.Payment;
import org.kh.billy.payment.model.vo.PaymentPaging;
import org.kh.billy.product.model.vo.Criteria;

public interface PaymentService {
	ArrayList<Payment> selectPaymentList();
	ArrayList<Payment> selectPaymentMyList();
	ArrayList<Payment> searchPayment(Payment payment);
	Payment selectPayment(String payment_no);
	int insertPayment(Payment payment);
	int updatePayment(Payment payment);
	int deletePayment(String payment_no);
	
	ArrayList<Payment> selectPaymentPList(Criteria cri);
	int selectPaymentCount(String userId);
	
	/*ArrayList<Payment> selectPaymentList(PaymentPaging setting);
	int selectTotalListCount(PaymentPaging setting);*/
}
