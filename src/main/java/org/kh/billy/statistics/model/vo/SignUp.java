package org.kh.billy.statistics.model.vo;

import org.springframework.stereotype.Component;

@Component
public class SignUp implements java.io.Serializable{

	private static final long serialVersionUID = -3959294912289329943L;

	private int signup_no;
	private String signup_date;
	private int firstCount;
	private int secondCount;
	private int thridCount;
	private int fourthCount;
	
	public SignUp() {}

	public SignUp(int signup_no, String signup_date, int firstCount, int secondCount, int thridCount, int fourthCount) {
		super();
		this.signup_no = signup_no;
		this.signup_date = signup_date;
		this.firstCount = firstCount;
		this.secondCount = secondCount;
		this.thridCount = thridCount;
		this.fourthCount = fourthCount;
	}

	public int getSignup_no() {
		return signup_no;
	}

	public void setSignup_no(int signup_no) {
		this.signup_no = signup_no;
	}

	public String getSignup_date() {
		return signup_date;
	}

	public void setSignup_date(String signup_date) {
		this.signup_date = signup_date;
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
		return "SignUp [signup_no=" + signup_no + ", signup_date=" + signup_date + ", firstCount=" + firstCount
				+ ", secondCount=" + secondCount + ", thridCount=" + thridCount + ", fourthCount=" + fourthCount + "]";
	}
		
}
