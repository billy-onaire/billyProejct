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
	private String customer;
	private String booking_no;
	private String seller_id;
	private String product_title;
	private String review_status;
	
	public Payment() {}

	public Payment(int payment_no, int payment_price, int payment_quantity, Date payment_begindate,
			Date payment_enddate, String status, int product_no, String customer, String booking_no, String seller_id,
			String product_title, String review_status) {
		super();
		this.payment_no = payment_no;
		this.payment_price = payment_price;
		this.payment_quantity = payment_quantity;
		this.payment_begindate = payment_begindate;
		this.payment_enddate = payment_enddate;
		this.status = status;
		this.product_no = product_no;
		this.customer = customer;
		this.booking_no = booking_no;
		this.seller_id = seller_id;
		this.product_title = product_title;
		this.review_status = review_status;
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

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(String booking_no) {
		this.booking_no = booking_no;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getproduct_title() {
		return product_title;
	}

	public void setproduct_title(String product_title) {
		this.product_title = product_title;
	}

	public String getReview_status() {
		return review_status;
	}

	public void setReview_status(String review_status) {
		this.review_status = review_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Payment [payment_no=" + payment_no + ", payment_price=" + payment_price + ", payment_quantity="
				+ payment_quantity + ", payment_begindate=" + payment_begindate + ", payment_enddate=" + payment_enddate
				+ ", status=" + status + ", product_no=" + product_no + ", customer=" + customer + ", booking_no="
				+ booking_no + ", seller_id=" + seller_id + ", product_title=" + product_title + ", review_status="
				+ review_status + "]";
	}
}

