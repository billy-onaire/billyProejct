package org.kh.billy.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Member implements Serializable{
	private static final long serialVersionUID = 5464773955019927030L;
	
	private String user_id;
	private String user_pwd;
	private String user_mobile;
	private String user_name;
	private String email;
	private String address;
	private Date user_enroll;
	private String verify;
	private Date user_update;
	private int report_count;
	private String delete_yn;
	private String my_introduce;
	private String location_area;
	private int total_count;
	
	public Member() {}
	
	public Member(String user_id, String user_pwd, String user_mobile, String user_name, String email, String address, Date user_enroll,
			String verify, Date user_update, int report_count, String delete_yn, String my_introduce,
			String location_area, int total_count) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_mobile = user_mobile;
		this.user_name = user_name;
		this.email = email;
		this.address = address;
		this.user_enroll = user_enroll;
		this.verify = verify;
		this.user_update = user_update;
		this.report_count = report_count;
		this.delete_yn = delete_yn;
		this.my_introduce = my_introduce;
		this.location_area = location_area;
		this.total_count = total_count;
	}

	
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	
	
	public String getUser_mobile() {
		return user_mobile;
	}



	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}



	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getUser_enroll() {
		return user_enroll;
	}

	public void setUser_enroll(Date user_enroll) {
		this.user_enroll = user_enroll;
	}

	public String getVerify() {
		return verify;
	}

	public void setVerify(String verify) {
		this.verify = verify;
	}

	public Date getUser_update() {
		return user_update;
	}

	public void setUser_update(Date user_update) {
		this.user_update = user_update;
	}

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}

	public String getDelete_yn() {
		return delete_yn;
	}

	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}

	public String getMy_introduce() {
		return my_introduce;
	}

	public void setMy_introduce(String my_introduce) {
		this.my_introduce = my_introduce;
	}

	public String getLocation_area() {
		return location_area;
	}

	public void setLocation_area(String location_area) {
		this.location_area = location_area;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name=" + user_name + ", email=" + email
				+ ", address=" + address + ", user_enroll=" + user_enroll + ", verify=" + verify + ", user_update="
				+ user_update + ", report_count=" + report_count + ", delete_yn=" + delete_yn + ", my_introduce="
				+ my_introduce + ", location_area=" + location_area + ", total_count=" + total_count + "]";
	}
	
	
	
}
