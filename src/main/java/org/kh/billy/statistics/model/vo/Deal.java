package org.kh.billy.statistics.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Deal implements java.io.Serializable{

	private static final long serialVersionUID = 5671060070171190215L;
	
	private int deal_no;
	private String deal_date;
	private int firstCount;
	private int secondCount;
	private int thridCount;
	private int fourthCount;
	
	public Deal() {}

	public Deal(int deal_no, String deal_date, int firstCount, int secondCount, int thridCount, int fourthCount) {
		super();
		this.deal_no = deal_no;
		this.deal_date = deal_date;
		this.firstCount = firstCount;
		this.secondCount = secondCount;
		this.thridCount = thridCount;
		this.fourthCount = fourthCount;
	}

	public int getDeal_no() {
		return deal_no;
	}

	public void setDeal_no(int deal_no) {
		this.deal_no = deal_no;
	}

	public String getDeal_date() {
		return deal_date;
	}

	public void setDeal_date(String deal_date) {
		this.deal_date = deal_date;
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
		return "Deal [deal_no=" + deal_no + ", deal_date=" + deal_date + ", firstCount=" + firstCount + ", secondCount="
				+ secondCount + ", thridCount=" + thridCount + ", fourthCount=" + fourthCount + "]";
	}

}
