package org.kh.billy.report.model.dao;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.report.model.vo.Report;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("rd")
public class ReportDao {

	public Product selectProductForReport(SqlSessionTemplate mybatisSession, int pno) {
		return mybatisSession.selectOne("productListMapper.selectProductForReport", pno);
	}

	public int insertReport(SqlSessionTemplate mybatisSession, Report r) {
		return mybatisSession.insert("reportMapper.insertReport", r);
	}

}
