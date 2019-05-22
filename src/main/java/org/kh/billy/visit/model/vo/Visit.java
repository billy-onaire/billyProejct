package org.kh.billy.visit.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Visit implements java.io.Serializable{

	private static final long serialVersionUID = -8238321964199136605L;

	private int visit_no;
	private String v_date;
	private String firstday;
	private String secondday;
	private String thridday;
	private String fourthday;

	public Visit() {}

	public Visit(int visit_no, String v_date, String firstday, String secondday, String thridday, String fourthday) {
		super();
		this.visit_no = visit_no;
		this.v_date = v_date;
		this.firstday = firstday;
		this.secondday = secondday;
		this.thridday = thridday;
		this.fourthday = fourthday;
	}

	public int getVisit_no() {
		return visit_no;
	}

	public void setVisit_no(int visit_no) {
		this.visit_no = visit_no;
	}

	public String getV_date() {
		return v_date;
	}

	public void setV_date(String v_date) {
		this.v_date = v_date;
	}

	public String getFirstday() {
		return firstday;
	}

	public void setFirstday(String firstday) {
		this.firstday = firstday;
	}

	public String getSecondday() {
		return secondday;
	}

	public void setSecondday(String secondday) {
		this.secondday = secondday;
	}

	public String getThridday() {
		return thridday;
	}

	public void setThridday(String thridday) {
		this.thridday = thridday;
	}

	public String getFourthday() {
		return fourthday;
	}

	public void setFourthday(String fourthday) {
		this.fourthday = fourthday;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Visit [visit_no=" + visit_no + ", v_date=" + v_date + ", firstday=" + firstday + ", secondday="
				+ secondday + ", thridday=" + thridday + ", fourthday=" + fourthday + "]";
	}
	
}

