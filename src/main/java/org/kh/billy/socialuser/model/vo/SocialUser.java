package org.kh.billy.socialuser.model.vo;

import org.springframework.stereotype.Component;

@Component
public class SocialUser implements java.io.Serializable{

	private static final long serialVersionUID = 397439662895313520L;

	private String user_id;
	private String social_type;
	private String social_code;
	private String name;
	private String profile;
	
	public SocialUser() {}

	public SocialUser(String user_id, String social_type, String social_code) {
		super();
		this.user_id = user_id;
		this.social_type = social_type;
		this.social_code = social_code;
	}

	
	public SocialUser(String user_id, String social_type, String social_code, String name, String profile) {
		super();
		this.user_id = user_id;
		this.social_type = social_type;
		this.social_code = social_code;
		this.name = name;
		this.profile = profile;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSocial_type() {
		return social_type;
	}

	public void setSocial_type(String social_type) {
		this.social_type = social_type;
	}

	public String getSocial_code() {
		return social_code;
	}

	public void setSocial_code(String social_code) {
		this.social_code = social_code;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "SocialUser [user_id=" + user_id + ", social_type=" + social_type + ", social_code=" + social_code + "]";
	}

}
