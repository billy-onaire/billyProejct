package org.kh.billy.product.model.service;

import java.util.ArrayList;

import org.kh.billy.product.model.dao.ProductDao;
import org.kh.billy.product.model.vo.ProductForList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ps")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	@Autowired
	private ProductDao pd;

	@Override
	public ArrayList<ProductForList> selectProductList() {
		return (ArrayList<ProductForList>) pd.selectProductList(mybatisSession);
	}

}
