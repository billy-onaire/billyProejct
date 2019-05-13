package org.kh.billy.product.model.service;

import org.kh.billy.product.model.dao.ProductDetailDao;
import org.kh.billy.product.model.vo.ProductDetail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("pdetailService")
public class ProductDetailServiceImpl implements ProductDetailService{

	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private ProductDetailDao pdetailDao;
	
	@Override
	public ProductDetail selectProductDetail(int pNo) {
		return pdetailDao.selectProductDetail(mybatisSession, pNo);
	}

	@Override
	public String selectAddress(String sellerId) {
		return pdetailDao.selectAddress(mybatisSession, sellerId);
	}

	@Override
	public Double selectAvgReview(int pNo) {
		return pdetailDao.selectAvgReview(mybatisSession, pNo);
	}

}
