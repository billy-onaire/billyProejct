package org.kh.billy.product.model.service;

import java.util.ArrayList;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.product.model.vo.SettingList;

public interface ProductManipulationService {
	
	int insertProduct(Product product);

	ArrayList<Product> selectProductList(SettingList settingList, String userId);

	int updateProduct(Product product);

	int deleteProduct(int productNo);
	
}
