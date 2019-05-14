package org.kh.billy.message.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Component
public class Message implements java.io.Serializable{
	private static final long serialVersionUID = -5651292997022584953L;
	
	//테이블의 컬럼명과 똑같이 필드명 지정함
	private int mms_no;
	private String recv_id;
	private String sent_id;
	private String mms_content;
	private Date sent_date;	
	private Date read_date;
	private String recv_read;
	private String recv_del;
	private String sent_del;
	private int product_no;
	private String recv_show;
	private String sent_show;
	private int mms_parent;
	
	
	public Message() {
		
	}


	public Message(int mms_no, String recv_id, String sent_id, String mms_content, Date sent_date, Date read_date,
			String recv_read, String recv_del, String sent_del, int product_no, String recv_show, String sent_show,
			int mms_parent) {
		super();
		this.mms_no = mms_no;
		this.recv_id = recv_id;
		this.sent_id = sent_id;
		this.mms_content = mms_content;
		this.sent_date = sent_date;
		this.read_date = read_date;
		this.recv_read = recv_read;
		this.recv_del = recv_del;
		this.sent_del = sent_del;
		this.product_no = product_no;
		this.recv_show = recv_show;
		this.sent_show = sent_show;
		this.mms_parent = mms_parent;
	}


	public int getMms_no() {
		return mms_no;
	}


	public void setMms_no(int mms_no) {
		this.mms_no = mms_no;
	}


	public String getRecv_id() {
		return recv_id;
	}


	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}


	public String getSent_id() {
		return sent_id;
	}


	public void setSent_id(String sent_id) {
		this.sent_id = sent_id;
	}


	public String getMms_content() {
		return mms_content;
	}


	public void setMms_content(String mms_content) {
		this.mms_content = mms_content;
	}


	public Date getSent_date() {
		return sent_date;
	}


	public void setSent_date(Date sent_date) {
		this.sent_date = sent_date;
	}


	public Date getRead_date() {
		return read_date;
	}


	public void setRead_date(Date read_date) {
		this.read_date = read_date;
	}


	public String getRecv_read() {
		return recv_read;
	}


	public void setRecv_read(String recv_read) {
		this.recv_read = recv_read;
	}


	public String getRecv_del() {
		return recv_del;
	}


	public void setRecv_del(String recv_del) {
		this.recv_del = recv_del;
	}


	public String getSent_del() {
		return sent_del;
	}


	public void setSent_del(String sent_del) {
		this.sent_del = sent_del;
	}


	public int getProduct_no() {
		return product_no;
	}


	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}


	public String getRecv_show() {
		return recv_show;
	}


	public void setRecv_show(String recv_show) {
		this.recv_show = recv_show;
	}


	public String getSent_show() {
		return sent_show;
	}


	public void setSent_show(String sent_show) {
		this.sent_show = sent_show;
	}


	public int getMms_parent() {
		return mms_parent;
	}


	public void setMms_parent(int mms_parent) {
		this.mms_parent = mms_parent;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Message [mms_no=" + mms_no + ", recv_id=" + recv_id + ", sent_id=" + sent_id + ", mms_content="
				+ mms_content + ", sent_date=" + sent_date + ", read_date=" + read_date + ", recv_read=" + recv_read
				+ ", recv_del=" + recv_del + ", sent_del=" + sent_del + ", product_no=" + product_no + ", recv_show="
				+ recv_show + ", sent_show=" + sent_show + ", mms_parent=" + mms_parent + "]";
	}


	

}
