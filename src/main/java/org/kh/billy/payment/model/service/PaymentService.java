package org.kh.billy.payment.model.service;

import java.util.ArrayList;

import org.kh.billy.payment.model.vo.Payment;

public interface PaymentService {
	ArrayList<Payment> selectPaymentList();
	ArrayList<Payment> searchPayment(Payment payment);
	Payment selectPayment(String payment_no);
	int insertPayment(Payment payment);
	int updatePayment(Payment payment);
	int deletePayment(String payment_no);
}
