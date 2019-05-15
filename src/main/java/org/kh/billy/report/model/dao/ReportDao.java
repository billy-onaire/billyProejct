package org.kh.billy.report.model.dao;

import java.util.List;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.report.model.vo.Report;
import org.kh.billy.report.model.vo.ReportList;
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

	public int selectCheckReport(SqlSessionTemplate mybatisSession, String request_id) {
		return mybatisSession.selectOne("reportMapper.selectCheckReport", request_id);
	}

	public List<ReportList> selectWhatIReport(SqlSessionTemplate mybatisSession, String request_id) {
		List<ReportList> list = mybatisSession.selectList("reportMapper.selectWhatIReport", request_id);
		return list;
	}

	public List<ReportList> selectReportedBy(SqlSessionTemplate mybatisSession, String request_id) {
		List<ReportList> list = mybatisSession.selectList("reportMapper.selectReportedBy", request_id);
		return list;
	}

}
