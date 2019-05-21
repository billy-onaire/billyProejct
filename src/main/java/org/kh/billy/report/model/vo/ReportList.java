package org.kh.billy.report.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ReportList implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7900844256569565545L;
	private int report_no;
	private int rcategory_no;
	private String report_content;
	private String report_id;
	private Date report_date;
	private int product_no;
	private String request_id;
	private String first_img;
	private String product_name;
	private String report_progress;
	
	public ReportList() {
		// TODO Auto-generated constructor stub
	}

	public ReportList(int report_no, int rcategory_no, String report_content, String report_id, Date report_date,
			int product_no, String request_id, String first_img, String product_name, String report_progress) {
		super();
		this.report_no = report_no;
		this.rcategory_no = rcategory_no;
		this.report_content = report_content;
		this.report_id = report_id;
		this.report_date = report_date;
		this.product_no = product_no;
		this.request_id = request_id;
		this.first_img = first_img;
		this.product_name = product_name;
		this.report_progress = report_progress;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public int getRcategory_no() {
		return rcategory_no;
	}

	public void setRcategory_no(int rcategory_no) {
		this.rcategory_no = rcategory_no;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getReport_id() {
		return report_id;
	}

	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getRequest_id() {
		return request_id;
	}

	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}

	public String getFirst_img() {
		return first_img;
	}

	public void setFirst_img(String first_img) {
		this.first_img = first_img;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getReport_progress() {
		return report_progress;
	}

	public void setReport_progress(String report_progress) {
		this.report_progress = report_progress;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReportList [report_no=" + report_no + ", rcategory_no=" + rcategory_no + ", report_content="
				+ report_content + ", report_id=" + report_id + ", report_date=" + report_date + ", product_no="
				+ product_no + ", request_id=" + request_id + ", first_img=" + first_img + ", product_name="
				+ product_name + ", report_progress=" + report_progress + "]";
	}
	
}
