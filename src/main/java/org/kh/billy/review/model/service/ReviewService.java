package org.kh.billy.review.model.service;

import java.util.ArrayList;

import org.kh.billy.review.model.vo.Review;

public interface ReviewService {

	ArrayList<Review> selectReview();
	int insertReview(Review review);
}
