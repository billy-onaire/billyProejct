package org.kh.billy.statistics.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Visit implements java.io.Serializable{

	private static final long serialVersionUID = -8238321964199136605L;

	private int visit_no;
	private String v_date;
	private String firstDay;
	private String secondDay;
	private String thridDay;
	private String fourthDay;
	private int firstCount;
	private int secondCount;
	private int thridCount;
	private int fourthCount;

	public Visit() {}

	public Visit(int visit_no, String v_date, String firstDay, String secondDay, String thridDay, String fourthDay,
			int firstCount, int secondCount, int thridCount, int fourthCount) {
		super();
		this.visit_no = visit_no;
		this.v_date = v_date;
		this.firstDay = firstDay;
		this.secondDay = secondDay;
		this.thridDay = thridDay;
		this.fourthDay = fourthDay;
		this.firstCount = firstCount;
		this.secondCount = secondCount;
		this.thridCount = thridCount;
		this.fourthCount = fourthCount;
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

	public String getFirstDay() {
		return firstDay;
	}

	public void setFirstDay(String firstDay) {
		this.firstDay = firstDay;
	}

	public String getSecondDay() {
		return secondDay;
	}

	public void setSecondDay(String secondDay) {
		this.secondDay = secondDay;
	}

	public String getThridDay() {
		return thridDay;
	}

	public void setThridDay(String thridDay) {
		this.thridDay = thridDay;
	}

	public String getFourthDay() {
		return fourthDay;
	}

	public void setFourthDay(String fourthDay) {
		this.fourthDay = fourthDay;
	}

	public int getFirstCount() {
		return firstCount;
	}

	public void setFirstCount(int firstCount) {
		this.firstCount = firstCount;
	}

	public int getSecondCount() {
		return secondCount;
	}

	public void setSecondCount(int secondCount) {
		this.secondCount = secondCount;
	}

	public int getThridCount() {
		return thridCount;
	}

	public void setThridCount(int thridCount) {
		this.thridCount = thridCount;
	}

	public int getFourthCount() {
		return fourthCount;
	}

	public void setFourthCount(int fourthCount) {
		this.fourthCount = fourthCount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Visit [visit_no=" + visit_no + ", v_date=" + v_date + ", firstDay=" + firstDay + ", secondDay="
				+ secondDay + ", thridDay=" + thridDay + ", fourthDay=" + fourthDay + ", firstCount=" + firstCount
				+ ", secondCount=" + secondCount + ", thridCount=" + thridCount + ", fourthCount=" + fourthCount + "]";
	}

}

