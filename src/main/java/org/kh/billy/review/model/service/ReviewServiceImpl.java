package org.kh.billy.review.model.service;

import java.util.ArrayList;

import org.kh.billy.review.model.dao.ReviewDao;
import org.kh.billy.review.model.vo.Review;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public int insertReview(Review review) {
		return reviewDao.insertReview(mybatisSession, review);
	}

	@Override
	public ArrayList<Review> selectReview() {
		return reviewDao.selectReview(mybatisSession);
	}

}
