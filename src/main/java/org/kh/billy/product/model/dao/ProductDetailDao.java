package org.kh.billy.product.model.dao;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.product.model.vo.ProductDetail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("pdetailDao")
public class ProductDetailDao {

	public ProductDetail selectProductDetail(SqlSessionTemplate session, int pNo) {
		return session.selectOne("productDetailMapper.selectProductDetail", pNo);
	}

	public String selectAddress(SqlSessionTemplate session, String sellerId) {
		return session.selectOne("productDetailMapper.selectAddress", sellerId);
	}

}
