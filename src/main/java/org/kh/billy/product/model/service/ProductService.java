package org.kh.billy.product.model.service;

import java.util.ArrayList;

import org.kh.billy.product.model.vo.ProductForList;

public interface ProductService {

	ArrayList<ProductForList> selectProductList();
}
