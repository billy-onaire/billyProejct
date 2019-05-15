package org.kh.billy.report.model.service;

import java.util.ArrayList;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.report.model.dao.ReportDao;
import org.kh.billy.report.model.vo.Report;
import org.kh.billy.report.model.vo.ReportList;
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

	@Override
	public int insertReport(Report r) {
		return rd.insertReport(mybatisSession, r);
	}

	@Override
	public int selectCheckReport(String id) {
		return rd.selectCheckReport(mybatisSession, id);
	}

	@Override
	public ArrayList<ReportList> selectWhatIReport(String id) {
		return (ArrayList<ReportList>) rd.selectWhatIReport(mybatisSession,id);
	}

	@Override
	public ArrayList<ReportList> selectReportedBy(String id) {
		return (ArrayList<ReportList>) rd.selectReportedBy(mybatisSession,id);
	}

}
