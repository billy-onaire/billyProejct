package org.kh.billy.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.review.model.vo.Review;
import org.kh.billy.review.model.vo.ReviewPaging;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("reviewDao")
public class ReviewDao {

	public ArrayList<Review> selectReview(SqlSessionTemplate session) {
		List<Review> list = session.selectList("reviewMapper.selectReview");
		ArrayList<Review> alist = (ArrayList<Review>)list;
		return alist;
	}

	public int insertReview(SqlSessionTemplate session, Review review) {
		return session.insert("reviewMapper.insertReview", review);
	}

	public List<Review> selectListReview(SqlSessionTemplate session, ReviewPaging paging) {
		return session.selectList("reviewMapper.selectListReview", paging);
	}

	public int selectTotalListReview(SqlSessionTemplate session) {
		return session.selectOne("reviewMapper.selectTotalListReview");
	}

}
