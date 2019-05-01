package org.kh.billy.product.model.dao;

import org.kh.billy.product.model.vo.Product;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("productInsertDao")
public class ProductInsertDao {

	public int insertProduct(SqlSessionTemplate session, Product product) {
		return session.insert("productInsertMapper.insertProduct", product);
	}
	
}
