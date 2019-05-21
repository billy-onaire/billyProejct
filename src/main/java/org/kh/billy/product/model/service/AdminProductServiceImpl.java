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

	@Override
	public int deleteProduct(int pNo) {
		return aProductDao.deleteProduct(pNo);
	}

	@Override
	public int restoreProduct(int pNo) {
		return aProductDao.restoreProduct(pNo);
	}

	@Override
	public List<Product> selectNormalProductList(ReviewPaging paging) {
		return aProductDao.selectNormalProductList(paging);
	}

	@Override
	public int selectTotalNormalProductList() {
		return aProductDao.selectTotalNormalProductList();
	}

	@Override
	public List<Product> selectDeleteProductList(ReviewPaging paging) {
		return aProductDao.selectDeleteProductList(paging);
	}

	@Override
	public int selectTotalDeleteProductList() {
		return aProductDao.selectTotalDeleteProductList();
	}

}
