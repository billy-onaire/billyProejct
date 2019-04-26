package org.kh.billy.message.model.service;

import java.util.ArrayList;

import org.kh.billy.message.model.vo.Message;

public interface MessageService {
	//추상메소드만 멤버로 가짐
	//[public abstract] 반환형 메소드명(자료형 매개변수);
	Message selectLogin(Message member);
	int insertMember(Message member);
	int updateMember(Message member);
	int deleteMember(String userid);
	ArrayList<Message> selectList();
	Message selectMember(String userid);
}
