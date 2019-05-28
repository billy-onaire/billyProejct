package org.kh.billy.product.model.dao;

import java.util.List;

import org.kh.billy.product.model.vo.ProductForList;
import org.kh.billy.product.model.vo.SettingList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("pd")
public class ProductDao {

	public List<ProductForList> selectProductList(SqlSessionTemplate mybatisSession, SettingList setting) {
		return mybatisSession.selectList("productListMapper.selectProductList", setting);
	}

	public int selectTotalListCount(SqlSessionTemplate mybatisSession, SettingList setting) {
		return mybatisSession.selectOne("productListMapper.selectTotalListCount", setting);
	}

	public int selectCountMyProduct(SqlSessionTemplate mybatisSession, String userId) {
		return mybatisSession.selectOne("productListMapper.selectCountMyProduct", userId);
	}

}
