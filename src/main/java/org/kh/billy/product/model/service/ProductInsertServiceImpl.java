package org.kh.billy.product.model.service;

import org.kh.billy.product.model.dao.ProductInsertDao;
import org.kh.billy.product.model.vo.Product;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productInsertService")
public class ProductInsertServiceImpl implements ProductInsertService{
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private ProductInsertDao productInsertDao;

	@Override
	public int insertProduct(Product product) {
		return productInsertDao.insertProduct(mybatisSession, product);
	}
	
	
	
}
