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


	int insertMessage(Message message);

	Message selectMessage(int mms_no);

	ArrayList<MessagePname> selectRecvList();

	ArrayList<MessagePname> selectSentList();

	int deleteFinalMessage(int mms_no);

	int insertReplyMessage(Message message, int mms_no);

	ArrayList<Message> selectDelList();

	MessagePname selectDetailMessage(int mms_no);

	int updateDelMessage(int mms_no);

	int updateOriginMessage(int mms_no);

	int selectMessageCount(String userId);

	

}
