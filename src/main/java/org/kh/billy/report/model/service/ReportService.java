package org.kh.billy.report.model.service;

import java.util.ArrayList;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.report.model.vo.Report;
import org.kh.billy.report.model.vo.ReportList;

public interface ReportService {

	Product selectProductForReport(int pno);

	int insertReport(Report r);

	int selectCheckReport(String request_id);

	ArrayList<ReportList> selectWhatIReport(String id);

	ArrayList<ReportList> selectReportedBy(String id);

	ArrayList<Report> selectReportList(); 
	
}
