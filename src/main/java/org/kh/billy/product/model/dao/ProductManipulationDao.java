package org.kh.billy.product.model.dao;

import java.util.ArrayList;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.product.model.vo.SettingList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("pmd")
public class ProductManipulationDao {

	public int insertProduct(SqlSessionTemplate session, Product product) {
		return session.insert("productManipulationMapper.insertProduct", product);
	}

	public ArrayList<Product> seleteMyProductList(SqlSessionTemplate session, SettingList settingList,
			String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public int productUpdate(SqlSessionTemplate session, Product product) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int productDelete(SqlSessionTemplate session, int productNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
