package org.kh.billy.message.model.service;

import java.util.ArrayList;
import org.kh.billy.message.model.vo.CriteriaMms;
import org.kh.billy.message.model.vo.Message;
import org.kh.billy.message.model.vo.MessagePname;


public interface MessageService {


	int insertMessage(Message message);

	Message selectMessage(int mms_no);

	ArrayList<MessagePname> selectRecvList(CriteriaMms cri);

	ArrayList<MessagePname> selectSentList(CriteriaMms cri);

	int deleteFinalMessage(int mms_no, String userid);

	int insertReplyMessage(MessagePname message);

	ArrayList<Message> selectDelList(CriteriaMms cri);

	MessagePname selectDetailMessage(int mms_no, String userid);

	int updateOriginMessage(int mms_no, String userid);

	int selectMessageCount(String userId);
	
	int selectMessageCount2(String userId);

	int selectMessageCount3(String userId);

	int updateDelRecvMessage(int mms_no);

	int updateDelSentMessage(int mms_no);


}
