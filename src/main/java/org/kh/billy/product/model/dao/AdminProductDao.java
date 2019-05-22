package org.kh.billy.product.model.dao;

import java.util.List;
import java.util.Map;

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

	public int deleteProduct(int pNo) {
		return session.update("adminProductMapper.deleteProduct", pNo);
	}

	public int restoreProduct(int pNo) {
		return session.update("adminProductMapper.restoreProduct", pNo);
	}

	public List<Product> selectNormalProductList(ReviewPaging paging) {
		return session.selectList("adminProductMapper.selectNormalProductList", paging);
	}

	public int selectTotalNormalProductList() {
		return session.selectOne("adminProductMapper.selectTotalNormalProductList");
	}

	public List<Product> selectDeleteProductList(ReviewPaging paging) {
		return session.selectList("adminProductMapper.selectDeleteProductList", paging);
	}

	public int selectTotalDeleteProductList() {
		return session.selectOne("adminProductMapper.selectTotalDeleteProductList");
	}

	public List<Product> selectSearchProductList(Map<String, Object> map) {
		return session.selectList("adminProductMapper.selectSearchProductList", map);
	}

	public int selectTotalSearchProductList(Map<String, Object> map) {
		return session.selectOne("adminProductMapper.selectTotalSearchProductList", map);
	}

}
