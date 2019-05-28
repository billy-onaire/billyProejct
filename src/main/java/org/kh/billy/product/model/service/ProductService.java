package org.kh.billy.product.model.service;

import java.util.ArrayList;

import org.kh.billy.product.model.vo.ProductForList;
import org.kh.billy.product.model.vo.SettingList;

public interface ProductService {

	ArrayList<ProductForList> selectProductList(SettingList setting);

	int selectTotalListCount(SettingList setting);

	int selectCountMyProduct(String userId);
}
