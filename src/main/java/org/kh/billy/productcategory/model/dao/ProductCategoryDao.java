package org.kh.billy.productcategory.model.dao;

import org.kh.billy.productcategory.model.vo.ProductCategory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("productCategoryDao")
public class ProductCategoryDao {
	
	public int selectProductCategory(SqlSessionTemplate session, ProductCategory productCategory) {
		return session.selectOne("productCategoryMapper.selectProductCategory", productCategory);
	}

}
