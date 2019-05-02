package org.kh.billy.message.model.service;

import java.util.ArrayList;

import org.kh.billy.message.model.vo.Message;
import org.kh.billy.product.model.vo.SettingList;

public interface MessageService {
	//추상메소드만 멤버로 가짐
	//[public abstract] 반환형 메소드명(자료형 매개변수);

	ArrayList<Message> selectMessageList(SettingList setting);

	int insertMessage(Message message);

}
