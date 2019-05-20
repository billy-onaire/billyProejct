package org.kh.billy.product.model.dao;

import java.util.List;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.review.model.vo.ReviewPaging;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("aProductDao")
public class AdminProductDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public List<Product> selectProductList(ReviewPaging paging) {
		return session.selectList("adminProductMapper.selectProductList", paging);
	}

	public int selectTotalProductList() {
		return session.selectOne("adminProductMapper.selectTotalProductList");
	}

}
