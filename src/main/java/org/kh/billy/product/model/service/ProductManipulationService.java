package org.kh.billy.product.model.service;

import java.util.ArrayList;

import org.kh.billy.product.model.vo.Criteria;
import org.kh.billy.product.model.vo.Product;
import org.kh.billy.product.model.vo.ProductForUpdate;

public interface ProductManipulationService {
	
	int insertProduct(Product product);

	ArrayList<Product> selectProductList(Criteria cri);

	int deleteProduct(int productNo);

	int selectProductCount(String userId);

	ProductForUpdate selectMyProduct(int productNo);

	int updateMyProduct(ProductForUpdate product);
	
}
