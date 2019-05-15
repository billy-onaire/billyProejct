package org.kh.billy.notice.model.service;

import java.util.ArrayList;

import org.kh.billy.notice.model.vo.Notice;
import org.kh.billy.notice.model.vo.NoticePage;

public interface NoticeService {

	ArrayList<Notice> selectNoticeList(NoticePage noticePage);

	int insertNotice(Notice notice);

	int updateNotice(Notice notice);

	int deleteNotice(int noticeNo);

}
