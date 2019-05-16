package org.kh.billy.payment.model.service;

import java.util.ArrayList;

import org.kh.billy.payment.model.vo.Payment;
import org.kh.billy.payment.model.vo.PaymentCri;
import org.kh.billy.payment.model.vo.PaymentPaging;
import org.kh.billy.payment.model.vo.PaymentSearchCri;

public interface PaymentService {
	ArrayList<Payment> selectPaymentList();
	ArrayList<Payment> selectPaymentMyList();
	ArrayList<Payment> searchPayment(Payment payment);
	Payment selectPayment(String payment_no);
	int insertPayment(Payment payment);
	int updatePayment(Payment payment);
	int deletePayment(String payment_no);
	
	ArrayList<Payment> listCriteria(PaymentCri payCri);
	int searchListCount(PaymentCri payCri);
	
	int searchWaitingListCount(PaymentCri payCri);
	ArrayList<Payment> listWatingCriteria(PaymentCri payCri);
	
	int insertBookingList(Payment payment);
	Payment selectBookingUser(String customer);

}
