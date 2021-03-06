package org.kh.billy.product.model.service;

import java.util.List;
import java.util.Map;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.review.model.vo.ReviewPaging;

public interface AdminProductService {
	
	List<Product> selectProductList(ReviewPaging paging);
	int selectTotalProductList();
	int deleteProduct(int pNo);
	int restoreProduct(int pNo);
	List<Product> selectNormalProductList(ReviewPaging paging);
	int selectTotalNormalProductList();
	List<Product> selectDeleteProductList(ReviewPaging paging);
	int selectTotalDeleteProductList();
	List<Product> selectSearchProductList(Map<String,Object> map);
	int selectTotalSearchProductList(Map<String,Object> map);
}
