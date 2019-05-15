package org.kh.billy.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.product.model.vo.Criteria;
import org.kh.billy.product.model.vo.Product;
import org.kh.billy.product.model.vo.ProductForUpdate;
import org.kh.billy.product.model.vo.SettingList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("pmd")
public class ProductManipulationDao {

	public int insertProduct(SqlSessionTemplate session, Product product) {
		return session.insert("productManipulationMapper.insertProduct", product);
	}

	public ArrayList<Product> seleteMyProductList(SqlSessionTemplate session, Criteria cri) {
		List<Product> list = session.selectList("productManipulationMapper.seleteMyProductList", cri);
		return (ArrayList<Product>)list;
	}

	public int deleteMyProduct(SqlSessionTemplate session, int productNo) {
		return session.update("productManipulationMapper.deleteMyProduct", productNo);
	}

	public int selectProductCount(SqlSessionTemplate session, String userId) {
		return session.selectOne("productManipulationMapper.selectProductCount", userId);
	}

	public ProductForUpdate selectMyProduct(SqlSessionTemplate session, int productNo) {
		return session.selectOne("productManipulationMapper.selectMyProduct", productNo);
	}

	public int updateMyProduct(SqlSessionTemplate session, ProductForUpdate product) {
		return session.update("productManipulationMapper.updateMyProduct", product);
	}

	public int updateMyImage(SqlSessionTemplate session, ProductForUpdate product) {
		return session.update("productManipulationMapper.updateMyImage", product);
	}
	
}
