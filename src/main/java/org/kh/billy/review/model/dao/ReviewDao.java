package org.kh.billy.review.model.dao;

import org.kh.billy.review.model.vo.Review;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("reviewDao")
public class ReviewDao {

	public Review selectReview(SqlSessionTemplate session, Review review) {
		return session.selectOne("reviewMapper.selectReview", review);
	}

	public int insertReview(SqlSessionTemplate session, Review review) {
		return session.insert("reviewMapper.insertReview", review);
	}

}
