package org.kh.billy.productimg.model.dao;

import org.kh.billy.productimg.model.vo.ProductImg;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("productImgDao")
public class ProductImgDao {

	public int insertProductImg(SqlSessionTemplate session, ProductImg productImg) {
		return session.insert("productImgMapper.insertProductImg", productImg);
	}

	public int selectProductImgNo(SqlSessionTemplate session, String first_img) {
		return session.selectOne("productImgMapper.selectProductImgNo", first_img);
	}

}
