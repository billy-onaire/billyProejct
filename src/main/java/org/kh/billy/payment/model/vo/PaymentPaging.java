package org.kh.billy.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class PaymentPaging implements Serializable {
	private static final long serialVersionUID = -7991284837736782252L;
	
	private int booking_no;
	private int payment_no;
	private String product_name;
	private int price;
	private String status;
	private String customer;
	private String seller_id;
	private int page;
	private int startPage;
	private int endPage;
	private int totalPage;
	private int totalCount;
	private int startList;
	private int endList;
	private int listCount;
	
	public PaymentPaging() {}

	public PaymentPaging(int booking_no, int payment_no, String product_name, int price, String status, String customer,
			String seller_id, int page, int startPage, int endPage, int totalPage, int totalCount, int startList,
			int endList, int listCount) {
		super();
		this.booking_no = booking_no;
		this.payment_no = payment_no;
		this.product_name = product_name;
		this.price = price;
		this.status = status;
		this.customer = customer;
		this.seller_id = seller_id;
		this.page = page;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
		this.startList = startList;
		this.endList = endList;
		this.listCount = listCount;
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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getEndList() {
		return endList;
	}

	public void setEndList(int endList) {
		this.endList = endList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public int getListCount() {
		return listCount;
	}
	
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	@Override
	public String toString() {
		return "PaymentPaging [booking_no=" + booking_no + ", payment_no=" + payment_no + ", product_name="
				+ product_name + ", price=" + price + ", status=" + status + ", customer=" + customer + ", seller_id="
				+ seller_id + ", page=" + page + ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage="
				+ totalPage + ", totalCount=" + totalCount + ", startList=" + startList + ", endList=" + endList + "]";
	}
	
	
}
