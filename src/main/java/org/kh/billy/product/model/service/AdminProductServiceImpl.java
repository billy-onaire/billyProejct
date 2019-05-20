package org.kh.billy.product.model.service;

import java.util.List;

import org.kh.billy.product.model.dao.AdminProductDao;
import org.kh.billy.product.model.vo.Product;
import org.kh.billy.review.model.vo.ReviewPaging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("aProductService")
public class AdminProductServiceImpl implements AdminProductService{

	@Autowired
	private AdminProductDao aProductDao;
	
	@Override
	public List<Product> selectProductList(ReviewPaging paging) {
		return aProductDao.selectProductList(paging);
	}

	@Override
	public int selectTotalProductList() {
		return aProductDao.selectTotalProductList();
	}

}
