package org.kh.billy.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.product.model.vo.Criteria;
import org.kh.billy.product.model.vo.Product;
import org.kh.billy.product.model.vo.SettingList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("pmd")
public class ProductManipulationDao {

	public int insertProduct(SqlSessionTemplate session, Product product) {
		return session.insert("productManipulationMapper.insertProduct", product);
	}

	public ArrayList<Product> seleteMyProductList(SqlSessionTemplate session, Criteria cri) {
		
		//List<Notice> list = session.selectList("noticeMapper.selectTop5Write");
		List<Product> list = session.selectList("productManipulationMapper.seleteMyProductList", cri);
		return (ArrayList<Product>)list;
	}

	public int productUpdate(SqlSessionTemplate session, Product product) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int productDelete(SqlSessionTemplate session, int productNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int selectProductCount(SqlSessionTemplate session, String userId) {
		return session.selectOne("productManipulationMapper.selectProductCount", userId);
	}
	
}
