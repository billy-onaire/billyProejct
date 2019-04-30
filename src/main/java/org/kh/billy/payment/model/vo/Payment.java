package org.kh.billy.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Payment implements Serializable {
	private static final long serialVersionUID = -6320233173673797151L;
	
	private int payment_no;
	private int payment_price;
	private int payment_quantity;
	private Date payment_begindate;
	private Date payment_enddate;
	private String status;
	private int product_no;
	
	public Payment() {}
	
	public Payment(int payment_no, int payment_price, int payment_quantity, Date payment_begindate,
			Date payment_enddate, String status, int product_no) {
		this.payment_no = payment_no;
		this.payment_price = payment_price;
		this.payment_quantity = payment_quantity;
		this.payment_begindate = payment_begindate;
		this.payment_enddate = payment_enddate;
		this.status = status;
		this.product_no = product_no;
	}
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public int getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}
	public int getPayment_quantity() {
		return payment_quantity;
	}
	public void setPayment_quantity(int payment_quantity) {
		this.payment_quantity = payment_quantity;
	}
	public Date getPayment_begindate() {
		return payment_begindate;
	}
	public void setPayment_begindate(Date payment_begindate) {
		this.payment_begindate = payment_begindate;
	}
	public Date getPayment_enddate() {
		return payment_enddate;
	}
	public void setPayment_enddate(Date payment_enddate) {
		this.payment_enddate = payment_enddate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "Payment [payment_no=" + payment_no + ", payment_price=" + payment_price + ", payment_quantity="
				+ payment_quantity + ", payment_begindate=" + payment_begindate + ", payment_enddate=" + payment_enddate
				+ ", status=" + status + ", product_no=" + product_no + "]";
	}
	
}
