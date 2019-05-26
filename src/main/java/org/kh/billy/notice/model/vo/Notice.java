package org.kh.billy.notice.model.vo;

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
	private String notice_originalfile;
	private String notice_renamefile;
	private Date notice_date;
	private Date notice_modifydate;
	private int notice_readcount;
	
	public Notice() {}

	public Notice(int notice_no, String admin_id, String notice_title, String notice_content,
			String notice_originalfile, String notice_renamefile, Date notice_date, Date notice_modifydate,
			int notice_readcount) {
		super();
		this.notice_no = notice_no;
		this.admin_id = admin_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_originalfile = notice_originalfile;
		this.notice_renamefile = notice_renamefile;
		this.notice_date = notice_date;
		this.notice_modifydate = notice_modifydate;
		this.notice_readcount = notice_readcount;
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

	public String getNotice_originalfile() {
		return notice_originalfile;
	}

	public void setNotice_originalfile(String notice_originalfile) {
		this.notice_originalfile = notice_originalfile;
	}

	public String getNotice_renamefile() {
		return notice_renamefile;
	}

	public void setNotice_renamefile(String notice_renamefile) {
		this.notice_renamefile = notice_renamefile;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public Date getNotice_modifydate() {
		return notice_modifydate;
	}

	public void setNotice_modifydate(Date notice_modifydate) {
		this.notice_modifydate = notice_modifydate;
	}

	public int getNotice_readcount() {
		return notice_readcount;
	}

	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", admin_id=" + admin_id + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_originalfile=" + notice_originalfile
				+ ", notice_renamefile=" + notice_renamefile + ", notice_date=" + notice_date + ", notice_modifydate="
				+ notice_modifydate + ", notice_readcount=" + notice_readcount + "]";
	}

	
}
