package org.kh.billy.product.model.vo;

import java.io.Serializable;

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
	
	public ProductForList() {
		// TODO Auto-generated constructor stub
	}

	public ProductForList(int product_no, String product_name, int price, String first_img) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.price = price;
		this.first_img = first_img;
	}

	public int getproduct_no() {
		return product_no;
	}

	public void setproduct_no(int product_no) {
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

	public String getfirst_img() {
		return first_img;
	}

	public void setfirst_img(String first_img) {
		this.first_img = first_img;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return product_no + ", " + product_name + ", " + price + ", " + first_img;
	}
	
	
}
