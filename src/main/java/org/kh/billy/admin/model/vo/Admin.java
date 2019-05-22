package org.kh.billy.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Admin implements java.io.Serializable{
	
	private static final long serialVersionUID = -7807992033479502762L;
	
	private String admin_id;
	private String admin_pwd;
	
	public Admin() {}

	public Admin(String admin_id, String admin_pwd) {
		super();
		this.admin_id = admin_id;
		this.admin_pwd = admin_pwd;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pwd() {
		return admin_pwd;
	}

	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", admin_pwd=" + admin_pwd + "]";
	}

}
