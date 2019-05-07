/*package org.kh.billy.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Notice implements Serializable{
	
	private static final long serialVersionUID = -1667938686116903018L;
	private int notice_no;
	private String admin_id;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	
	public Notice() {}

	public Notice(int notice_no, String admin_id, String notice_title, String notice_content, Date notice_date) {
		super();
		this.notice_no = notice_no;
		this.admin_id = admin_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", admin_id=" + admin_id + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_date=" + notice_date + "]";
	}
	
	
	
	
}
*/