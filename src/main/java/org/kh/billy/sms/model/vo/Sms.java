package org.kh.billy.sms.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Sms implements java.io.Serializable{
	
	private static final long serialVersionUID = -3996164600674895888L;
	
	private String user_id;
	private String authno;
	
	public Sms() {}

	public Sms(String user_id, String authno) {
		super();
		this.user_id = user_id;
		this.authno = authno;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getAuthno() {
		return authno;
	}

	public void setAuthno(String authno) {
		this.authno = authno;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Sms [user_id=" + user_id + ", authno=" + authno + "]";
	}

}
