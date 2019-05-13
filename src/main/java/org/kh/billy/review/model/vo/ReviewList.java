package org.kh.billy.review.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class ReviewList implements java.io.Serializable{
	private static final long serialVersionUID = -2995720159152875863L;
	
	private int payment_no;
	private int payment_price;
	private int payment_quantity;
	private Date payment_begindate;
	private Date payment_enddate;
	private String status;
	private int product_no;
	private String customer;
	private String first_img;
	private String product_name;
	private String review_status;
	
	public ReviewList() {}

	public ReviewList(int payment_no, int payment_price, int payment_quantity, Date payment_begindate,
			Date payment_enddate, String status, int product_no, String customer, String first_img, String product_name,
			String review_status) {
		super();
		this.payment_no = payment_no;
		this.payment_price = payment_price;
		this.payment_quantity = payment_quantity;
		this.payment_begindate = payment_begindate;
		this.payment_enddate = payment_enddate;
		this.status = status;
		this.product_no = product_no;
		this.customer = customer;
		this.first_img = first_img;
		this.product_name = product_name;
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

	public String getFirst_img() {
		return first_img;
	}

	public void setFirst_img(String first_img) {
		this.first_img = first_img;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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
		return "ReviewList [payment_no=" + payment_no + ", payment_price=" + payment_price + ", payment_quantity="
				+ payment_quantity + ", payment_begindate=" + payment_begindate + ", payment_enddate=" + payment_enddate
				+ ", status=" + status + ", product_no=" + product_no + ", customer=" + customer + ", first_img="
				+ first_img + ", product_name=" + product_name + ", review_status=" + review_status + "]";
	}

	
	
}
