package org.kh.billy.report.model.dao;

import org.kh.billy.product.model.vo.Product;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("rd")
public class ReportDao {

	public Product selectProductForReport(SqlSessionTemplate mybatisSession, int pno) {
		return mybatisSession.selectOne("productListMapper.selectProductForReport", pno);
	}

}
