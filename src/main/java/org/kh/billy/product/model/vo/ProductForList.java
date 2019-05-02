package org.kh.billy.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class ProductForList implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1363770900455199516L;
	
	private int product_no;
	private String product_name;
	private int price;
	private String first_img;
	private Date product_date;
	private double avg;
	
	public ProductForList() {
	}

	public ProductForList(int product_no, String product_name, int price, String first_img, Date product_date,
			double avg) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.price = price;
		this.first_img = first_img;
		this.product_date = product_date;
		this.avg = avg;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
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

	public String getFirst_img() {
		return first_img;
	}

	public void setFirst_img(String first_img) {
		this.first_img = first_img;
	}

	public Date getProduct_date() {
		return product_date;
	}

	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ProductForList [product_no=" + product_no + ", product_name=" + product_name + ", price=" + price
				+ ", first_img=" + first_img + ", product_date=" + product_date + ", avg=" + avg + "]";
	}
	
	
	
}
