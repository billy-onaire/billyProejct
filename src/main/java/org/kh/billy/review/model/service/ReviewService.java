package org.kh.billy.review.model.service;

import org.kh.billy.review.model.vo.Review;

public interface ReviewService {

	Review selectReview(Review review);
	int insertReview(Review review);
}
