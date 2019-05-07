package org.kh.billy.message.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;

import org.kh.billy.message.model.dao.MessageDao;
import org.kh.billy.message.model.vo.Message;
import org.kh.billy.message.model.vo.MessagePname;
import org.kh.billy.product.model.vo.SettingList;

public interface MessageService {
	//추상메소드만 멤버로 가짐
	//[public abstract] 반환형 메소드명(자료형 매개변수);


	int insertMessage(Message message);

	Message selectMessage(int mms_no);

	ArrayList<MessagePname> selectRecvList();

	ArrayList<MessagePname> selectSentList();

	int selectTotalListCount(SettingList setting);

	int updateDelMessage(int mms_no);

	int deleteFinalMessage(int mms_no);


	int insertReplyMessage(Message message, int mms_no);

	ArrayList<Message> selectDelList();

	List<Map<String, Object>> selectDetailMessage(Map param);

	

}
