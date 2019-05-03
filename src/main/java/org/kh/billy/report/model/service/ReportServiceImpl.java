package org.kh.billy.report.model.service;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.report.model.dao.ReportDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("rs")
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportDao rd;
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Override
	public Product selectProductForReport(int pno) {
		return rd.selectProductForReport(mybatisSession, pno);
	}

}
