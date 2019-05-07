package org.kh.billy.product.model.service;

import java.util.ArrayList;

import org.kh.billy.product.model.dao.ProductManipulationDao;
import org.kh.billy.product.model.vo.Product;
import org.kh.billy.product.model.vo.SettingList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("pms")
public class ProductManipulationServiceImpl implements ProductManipulationService{
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private ProductManipulationDao productInsertDao;

	@Override
	public int insertProduct(Product product) {
		return productInsertDao.insertProduct(mybatisSession, product);
	}

	@Override
	public ArrayList<Product> selectProductList(SettingList settingList, String userId) {
		return productInsertDao.seleteMyProductList(mybatisSession, settingList, userId);
	}

	@Override
	public int updateProduct(Product product) {
		return productInsertDao.productUpdate(mybatisSession, product);
	}

	@Override
	public int deleteProduct(int productNo) {
		return productInsertDao.productDelete(mybatisSession, productNo);
		
	}
	
	
	
}
