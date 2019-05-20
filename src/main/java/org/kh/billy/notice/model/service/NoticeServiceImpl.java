package org.kh.billy.notice.model.service;

import java.util.ArrayList;

import org.kh.billy.notice.model.dao.NoticeDao;
import org.kh.billy.notice.model.vo.Notice;
import org.kh.billy.notice.model.vo.NoticePage;
import org.kh.billy.product.model.vo.Criteria;
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
	public ArrayList<Notice> selectNoticeList(Criteria cri) {
		
		return noticeDao.selectNoticeList(mybatisSession,cri);
	}

	@Override
	public int insertNotice(Notice notice) {

		return noticeDao.insertNotice(mybatisSession, notice);
	}

	@Override
	public int updateNotice(Notice notice) {

		return noticeDao.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeNo) {

		return noticeDao.deleteNotice(noticeNo);
	}

	@Override
	public int selectNoticeCount() {
		return noticeDao.selectNoticeCount(mybatisSession);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return noticeDao.selectNotice(mybatisSession, noticeNo);
	}

}
