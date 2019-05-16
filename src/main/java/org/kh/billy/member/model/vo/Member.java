package org.kh.billy.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Member implements java.io.Serializable{

	private static final long serialVersionUID = 791489045932352347L;
	
	   private String user_id;
	   private String user_pwd;
	   private String user_mobile;
	   private String user_name;
	   private String email;
	   private String authkey;
	   private String verify;
	   private String address;
	   private String my_introduce;
	   private String location_area;
	   private Date user_enroll;
	   private Date user_update;
	   private int report_count;
	   private String delete_yn;
	   private int total_count;
	   private String social_type;
	   private String profile;
	   private String social_code;
	   private String sname;
	   
	   public Member() {}
	   
	   public Member(String user_id, String user_pwd, String user_mobile, String user_name, String email, String authkey, String verify,
			String address, String my_introduce, String location_area, Date user_enroll, Date user_update,
			int report_count, String delete_yn, int total_count) {

		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_mobile = user_mobile;
		this.user_name = user_name;
		this.email = email;
		this.authkey = authkey;
		this.verify = verify;
		this.address = address;
		this.my_introduce = my_introduce;
		this.location_area = location_area;
		this.user_enroll = user_enroll;
		this.user_update = user_update;
		this.report_count = report_count;
		this.delete_yn = delete_yn;
		this.total_count = total_count;
	}

	public Member(String user_id, String user_pwd, String user_mobile, String user_name, String email, String authkey,
			String verify, String address, String my_introduce, String location_area, Date user_enroll,
			Date user_update, int report_count, String delete_yn, int total_count, String social_type, String profile,
			String social_code, String sname) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_mobile = user_mobile;
		this.user_name = user_name;
		this.email = email;
		this.authkey = authkey;
		this.verify = verify;
		this.address = address;
		this.my_introduce = my_introduce;
		this.location_area = location_area;
		this.user_enroll = user_enroll;
		this.user_update = user_update;
		this.report_count = report_count;
		this.delete_yn = delete_yn;
		this.total_count = total_count;
		this.social_type = social_type;
		this.profile = profile;
		this.social_code = social_code;
		this.sname = sname;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
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
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_mobile() {
		return user_mobile;
	}
	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
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
	public String getVerify() {
		return verify;
	}
	public void setVerify(String verify) {
		this.verify = verify;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public Date getUser_enroll() {
		return user_enroll;
	}
	public void setUser_enroll(Date user_enroll) {
		this.user_enroll = user_enroll;
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
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getSocial_type() {
		return social_type;
	}

	public void setSocial_type(String social_type) {
		this.social_type = social_type;
	}
	
	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	public String getSocial_code() {
		return social_code;
	}

	public void setSocial_code(String social_code) {
		this.social_code = social_code;
	}
	
	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_mobile=" + user_mobile + ", user_name="
				+ user_name + ", email=" + email + ", authkey=" + authkey + ", verify=" + verify + ", address="
				+ address + ", my_introduce=" + my_introduce + ", location_area=" + location_area + ", user_enroll="
				+ user_enroll + ", user_update=" + user_update + ", report_count=" + report_count + ", delete_yn="
				+ delete_yn + ", total_count=" + total_count + ", social_type=" + social_type + ", profile=" + profile
				+ ", social_code=" + social_code + ", sname=" + sname + "]";
	}

}
