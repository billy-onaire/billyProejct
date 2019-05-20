package org.kh.billy.product.model.service;

import java.util.List;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.review.model.vo.ReviewPaging;

public interface AdminProductService {
	
	List<Product> selectProductList(ReviewPaging paging);
	int selectTotalProductList();
}
