package org.kh.billy.product.model.dao;

import org.kh.billy.product.model.vo.Product;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("pdetailDao")
public class ProductDetailDao {

	public Product selectProductDetail(SqlSessionTemplate session, int pNum) {
		return session.selectOne("productDetailMapper.selectProductDetail", pNum);
	}

}
