package org.kh.billy.review.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.review.model.vo.Review;
import org.kh.billy.review.model.vo.ReviewPaging;

public interface ReviewService {

	ArrayList<Review> selectReview();
	int insertReview(Review review);
	List<Review> selectListReview(ReviewPaging paging);
	int selectTotalListReview();
}
