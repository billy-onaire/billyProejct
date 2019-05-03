package org.kh.billy.payment.model.service;

import java.util.ArrayList;

import org.kh.billy.payment.model.vo.Payment;

public interface PaymentService {
	ArrayList<Payment> selectPaymentList();
	/*Member selectLogin(Member member); 
	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(String userid);
	Member selectMember(String userid);
	ArrayList<String> searchId(Member member);*/
}
