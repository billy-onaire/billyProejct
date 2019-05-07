package org.kh.billy.product.model.service;

import org.kh.billy.product.model.dao.ProductDetailDao;
import org.kh.billy.product.model.vo.Product;
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
	public Product selectProductDetail(int pNum) {
		return pdetailDao.selectProductDetail(mybatisSession, pNum);
	}

}
