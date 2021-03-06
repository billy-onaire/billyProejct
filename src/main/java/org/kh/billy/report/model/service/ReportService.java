package org.kh.billy.report.model.service;

import java.util.ArrayList;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.report.model.vo.Report;
import org.kh.billy.report.model.vo.ReportCheck;
import org.kh.billy.report.model.vo.ReportList;
import org.kh.billy.report.model.vo.ReportSetting;

public interface ReportService {

	Product selectProductForReport(int pno);

	int insertReport(Report r);

	int selectCheckReport(ReportCheck r);

	ArrayList<ReportList> selectWhatIReport(String id);

	ArrayList<ReportList> selectReportedBy(String id);

	ArrayList<Report> selectReportList(ReportSetting setting);

	int selectTotalListCount(ReportSetting setting);

	int updateReportApproval1(String rno);

	int updateReportApproval2(String rid);

	int updateReportDisapporval(String rno); 
	
}
