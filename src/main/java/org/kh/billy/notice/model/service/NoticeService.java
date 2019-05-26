package org.kh.billy.notice.model.service;

import java.util.ArrayList;

import org.kh.billy.notice.model.vo.Notice;
import org.kh.billy.notice.model.vo.NoticePage;
import org.kh.billy.product.model.vo.Criteria;

public interface NoticeService {

	int insertNotice(Notice notice);

	int updateNotice(Notice notice);

	int deleteNotice(int noticeNo);

	int selectNoticeCount();

	ArrayList<Notice> selectNoticeList(Criteria cri);

	Notice selectNotice(int noticeNo);

	int updateNoticeReadCount(int noticeNo);

}
