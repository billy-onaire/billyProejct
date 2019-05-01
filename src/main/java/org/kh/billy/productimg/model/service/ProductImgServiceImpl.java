package org.kh.billy.productimg.model.service;

import org.kh.billy.productimg.model.dao.ProductImgDao;
import org.kh.billy.productimg.model.vo.ProductImg;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productImgService")
public class ProductImgServiceImpl implements ProductImgService{

	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private ProductImgDao productImgDao = new ProductImgDao();
	
	@Override
	public int insertProductImg(ProductImg productImg) {
		return productImgDao.insertProductImg(mybatisSession, productImg);
	}

	@Override
	public int selectProductImgNo(String first_img) {
		return productImgDao.selectProductImgNo(mybatisSession, first_img);
	}

}
