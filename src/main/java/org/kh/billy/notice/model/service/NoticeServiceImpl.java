package org.kh.billy.notice.model.service;

import java.util.ArrayList;

import org.kh.billy.notice.model.dao.NoticeDao;
import org.kh.billy.notice.model.vo.Notice;
import org.kh.billy.notice.model.vo.NoticePage;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public ArrayList<Notice> selectNoticeList(NoticePage noticePage) {
		
		return noticeDao.selectNoticeList(noticePage);
	}

	@Override
	public int insertNotice(Notice notice) {

		return noticeDao.insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {

		return noticeDao.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeNo) {

		return noticeDao.deleteNotice(noticeNo);
	}

}
