package org.kh.billy.report.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.report.model.vo.Report;
import org.kh.billy.report.model.vo.ReportCheck;
import org.kh.billy.report.model.vo.ReportList;
import org.kh.billy.report.model.vo.ReportSetting;
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

	public int selectCheckReport(SqlSessionTemplate mybatisSession, ReportCheck r) {
		return mybatisSession.selectOne("reportMapper.selectCheckReport", r);
	}

	public List<ReportList> selectWhatIReport(SqlSessionTemplate mybatisSession, String request_id) {
		List<ReportList> list = mybatisSession.selectList("reportMapper.selectWhatIReport", request_id);
		return list;
	}

	public List<ReportList> selectReportedBy(SqlSessionTemplate mybatisSession, String request_id) {
		List<ReportList> list = mybatisSession.selectList("reportMapper.selectReportedBy", request_id);
		return list;
	}

	public List<Report> selectReportList(SqlSessionTemplate mybatisSession, ReportSetting setting) {
		List<Report> list = mybatisSession.selectList("reportMapper.selectReportList", setting);
		return list;
	}

	public int selectTotalListCount(SqlSessionTemplate mybatisSession, ReportSetting setting) {
		
		return mybatisSession.selectOne("reportMapper.selectTotalListCount", setting);
	}

	public int updateReportApproval1(SqlSessionTemplate mybatisSession, String rno) {
		System.out.println("dao : "+rno);
		return mybatisSession.update("reportMapper.updateReportApproval1", rno);
	}

	public int updateReportApproval2(SqlSessionTemplate mybatisSession, String rid) {
		return mybatisSession.update("reportMapper.updateReportApproval2", rid);
	}

	public int updateReportDisapproval(SqlSessionTemplate mybatisSession, String rno) {
		return mybatisSession.update("reportMapper.updateReportDisapproval",rno);
	}


}
