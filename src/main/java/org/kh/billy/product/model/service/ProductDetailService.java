package org.kh.billy.product.model.service;

import org.kh.billy.product.model.vo.ProductDetail;

public interface ProductDetailService {
	ProductDetail selectProductDetail(int pNo);

	String selectAddress(String sellerId);

	Double selectAvgReview(int pNo);

}
