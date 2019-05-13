package org.kh.billy.review.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.review.model.dao.ReviewDao;
import org.kh.billy.review.model.vo.Review;
import org.kh.billy.review.model.vo.ReviewList;
import org.kh.billy.review.model.vo.ReviewPaging;
import org.kh.billy.review.model.vo.ReviewPagingFront;
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
	public List<ReviewList> selectListReview(ReviewPaging paging) {
		return reviewDao.selectListReview(mybatisSession, paging);
	}

	@Override
	public int selectTotalListReview() {
		return reviewDao.selectTotalListReview(mybatisSession);
	}

	@Override
	public List<Review> selectPdetailReview(ReviewPagingFront paging) {
		return reviewDao.selectPdetailReview(mybatisSession, paging);
	}

	@Override
	public int selectTotalPdetailReview(int productNo) {
		return reviewDao.selectTotalPdetailReview(mybatisSession, productNo);
	}

}
