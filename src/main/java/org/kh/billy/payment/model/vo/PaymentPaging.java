package org.kh.billy.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PaymentPaging implements Serializable {
	private static final long serialVersionUID = -7991284837736782252L;
	
	private int booking_no;
	private int payment_no;
	private String product_name;
	private int price;
	private String status;
	private String customer;
	private String seller_id;
	
	public PaymentPaging() {}

	public PaymentPaging(int booking_no, int payment_no, String product_name, int price, String status, String customer,
			String seller_id) {
		super();
		this.booking_no = booking_no;
		this.payment_no = payment_no;
		this.product_name = product_name;
		this.price = price;
		this.status = status;
		this.customer = customer;
		this.seller_id = seller_id;
	}

	public int getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(int booking_no) {
		this.booking_no = booking_no;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PaymentPaging [booking_no=" + booking_no + ", payment_no=" + payment_no + ", product_name="
				+ product_name + ", price=" + price + ", status=" + status + ", customer=" + customer + ", seller_id="
				+ seller_id + "]";
	}

}
