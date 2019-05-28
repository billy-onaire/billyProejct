package org.kh.billy.report.model.vo;

public class ReportCheck {
	private String report_id;
	private String request_id;
	public ReportCheck(String report_id, String request_id) {
		super();
		this.report_id = report_id;
		this.request_id = request_id;
	}
	public String getReport_id() {
		return report_id;
	}
	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}
	public String getRequest_id() {
		return request_id;
	}
	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}
	
	public ReportCheck() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ReportCheck [report_id=" + report_id + ", request_id=" + request_id + "]";
	}
	
}
