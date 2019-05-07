package org.kh.billy.product.model.service;

import java.util.ArrayList;

import org.kh.billy.product.model.dao.ProductManipulationDao;
import org.kh.billy.product.model.vo.Criteria;
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
	private ProductManipulationDao pmd;

	@Override
	public int insertProduct(Product product) {
		return pmd.insertProduct(mybatisSession, product);
	}

	@Override
	public ArrayList<Product> selectProductList(Criteria cri) {
		return pmd.seleteMyProductList(mybatisSession, cri);
	}

	@Override
	public int updateProduct(Product product) {
		return pmd.productUpdate(mybatisSession, product);
	}

	@Override
	public int deleteProduct(int productNo) {
		return pmd.productDelete(mybatisSession, productNo);
		
	}

	@Override
	public int selectProductCount(String userId) {
		return pmd.selectProductCount(mybatisSession, userId);
	}
	
	
	
}
