package org.kh.billy.product.model.service;

import java.util.ArrayList;

import org.kh.billy.product.model.vo.Criteria;
import org.kh.billy.product.model.vo.Product;

public interface ProductManipulationService {
	
	int insertProduct(Product product);

	ArrayList<Product> selectProductList(Criteria cri);

	int updateProduct(Product product);

	int deleteProduct(int productNo);

	int selectProductCount(String userId);
	
}
