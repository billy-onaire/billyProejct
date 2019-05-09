package org.kh.billy.review.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.review.model.vo.Review;
import org.kh.billy.review.model.vo.ReviewList;
import org.kh.billy.review.model.vo.ReviewPaging;
import org.kh.billy.review.model.vo.ReviewPagingFront;

public interface ReviewService {

	List<Review> selectPdetailReview(ReviewPagingFront paging);
	int insertReview(Review review);
	List<ReviewList> selectListReview(ReviewPaging paging);
	int selectTotalListReview();
	int selectTotalPdetailReview();
}
