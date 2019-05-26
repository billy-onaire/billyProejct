package org.kh.billy.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.notice.model.vo.Notice;
import org.kh.billy.notice.model.vo.NoticePage;
import org.kh.billy.product.model.vo.Criteria;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate session, Criteria cri) {
		List<Notice> list =  session.selectList("noticeMapper.selectNoticeList", cri);
		return (ArrayList<Notice>)list;
	}

	public int insertNotice(SqlSessionTemplate session, Notice notice) {
		return session.insert("noticeMapper.insertNotice", notice);
	}

	public int updateNotice(SqlSessionTemplate session, Notice notice) {
		return session.update("noticeMapper.updateNotice", notice);
	}

	public int deleteNotice(SqlSessionTemplate session, int noticeNo) {
		return session.delete("noticeMapper.deleteNotice", noticeNo);
	}

	public int selectNoticeCount(SqlSessionTemplate session) {
		return session.selectOne("noticeMapper.selectNoticeCount");
	}

	public Notice selectNotice(SqlSessionTemplate session, int noticeNo) {
		return session.selectOne("noticeMapper.selectNotice", noticeNo);
	}

	public int updateNoticeReadCount(SqlSessionTemplate session, int noticeNo) {
		return session.update("noticeMapper.updateNoticeReadCount", noticeNo);
	}
}
