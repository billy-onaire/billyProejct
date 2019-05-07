package org.kh.billy.report.model.service;

import org.kh.billy.product.model.vo.Product;
import org.kh.billy.report.model.vo.Report;

public interface ReportService {

	Product selectProductForReport(int pno);

	int insertReport(Report r); 
	
}
