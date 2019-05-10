package org.kh.billy.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.review.model.vo.Review;
import org.kh.billy.review.model.vo.ReviewList;
import org.kh.billy.review.model.vo.ReviewPaging;
import org.kh.billy.review.model.vo.ReviewPagingFront;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("reviewDao")
public class ReviewDao {

	public int insertReview(SqlSessionTemplate session, Review review) {
		return session.insert("reviewMapper.insertReview", review);
	}

	public List<ReviewList> selectListReview(SqlSessionTemplate session, ReviewPaging paging) {
		return session.selectList("reviewMapper.selectListReview", paging);
	}

	public int selectTotalListReview(SqlSessionTemplate session) {
		return session.selectOne("reviewMapper.selectTotalListReview");
	}

	public List<Review> selectPdetailReview(SqlSessionTemplate session, ReviewPagingFront pagingFront) {
		return session.selectList("reviewMapper.selectPdetailReview", pagingFront);
	}

	public int selectTotalPdetailReview(SqlSessionTemplate session) {
		return session.selectOne("reviewMapper.selectTotalListReview");
	}
}
