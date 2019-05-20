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

	public int updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int selectNoticeCount(SqlSessionTemplate session) {
		return session.selectOne("noticeMapper.selectNoticeCount");
	}

	public Notice selectNotice(SqlSessionTemplate session, int noticeNo) {
		return session.selectOne("noticeMapper.selectNotice", noticeNo);
	}

}
