package org.kh.billy.productimg.model.service;

import org.kh.billy.productimg.model.vo.ProductImg;

public interface ProductImgService {
	int insertProductImg(ProductImg productImg);

	int selectProductImgNo(String first_img);
}
