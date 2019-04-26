package org.kh.billy.product.model.dao;

import java.util.List;

import org.kh.billy.product.model.vo.ProductForList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("pd")
public class ProductDao {

	public List<ProductForList> selectProductList(SqlSessionTemplate mybatisSession) {
		return mybatisSession.selectList("productListMapper.selectProductList");
	}

}
