package org.kh.billy.review.model.service;

import java.util.List;

import org.kh.billy.review.model.vo.Review;
import org.kh.billy.review.model.vo.ReviewList;
import org.kh.billy.review.model.vo.ReviewPaging;
import org.kh.billy.review.model.vo.ReviewPagingFront;

public interface ReviewService {

	List<Review> selectPdetailReview(ReviewPagingFront paging);
	int insertReview(Review review);
	List<ReviewList> selectListReview(ReviewPaging paging);
	int selectTotalListReview(String userId);
	int selectTotalPdetailReview(int productNo);
	int deleteReview(int rno);
	int updateReviewStatus(int paymentNo);
}
