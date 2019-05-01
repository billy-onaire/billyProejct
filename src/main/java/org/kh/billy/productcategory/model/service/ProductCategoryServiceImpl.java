package org.kh.billy.productcategory.model.service;

import org.kh.billy.productcategory.model.dao.ProductCategoryDao;
import org.kh.billy.productcategory.model.vo.ProductCategory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productCategoryService")
public class ProductCategoryServiceImpl implements ProductCategoryService{

	@Autowired
	private SqlSessionTemplate mybatisSession;
	@Autowired
	private ProductCategoryDao productCategoryDao;
	
	@Override
	public int selectProductCategory(ProductCategory productCategory) {
		return productCategoryDao.selectProductCategory(mybatisSession, productCategory);
	}

}
