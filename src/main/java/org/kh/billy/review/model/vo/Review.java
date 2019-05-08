package org.kh.billy.review.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class Review implements java.io.Serializable{

	private static final long serialVersionUID = 6163637876178239179L;
	
	private int review_no;
	private String review_content;
	private String review_image;
	private int point;
	private Date review_date;
	private int payment_no;
	
	public Review () {}

	public Review(int review_no, String review_content, String review_image, int point, Date review_date,
			int payment_no) {
		super();
		this.review_no = review_no;
		this.review_content = review_content;
		this.review_image = review_image;
		this.point = point;
		this.review_date = review_date;
		this.payment_no = payment_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_image() {
		return review_image;
	}

	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", review_content=" + review_content + ", review_image="
				+ review_image + ", point=" + point + ", review_date=" + review_date + ", payment_no=" + payment_no
				+ "]";
	}
	
	
	
	
	
	

}
