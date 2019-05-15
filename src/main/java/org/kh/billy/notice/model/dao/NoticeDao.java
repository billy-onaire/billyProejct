package org.kh.billy.notice.model.dao;

import java.util.ArrayList;

import org.kh.billy.notice.model.vo.Notice;
import org.kh.billy.notice.model.vo.NoticePage;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {

	public ArrayList<Notice> selectNoticeList(NoticePage noticePage) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
