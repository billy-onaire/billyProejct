package org.kh.billy.productcategory.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class ProductCategory implements Serializable{

	private static final long serialVersionUID = 1827722583865730735L;
	
	private int pcategory_no;
	private String pcategory_name;
	private String sub_pcategory_name;
	
	public ProductCategory() {}

	public ProductCategory(int pcategory_no, String pcategory_name, String sub_pcategory_name) {
		super();
		this.pcategory_no = pcategory_no;
		this.pcategory_name = pcategory_name;
		this.sub_pcategory_name = sub_pcategory_name;
	}

	public int getPcategory_no() {
		return pcategory_no;
	}

	public void setPcategory_no(int pcategory_no) {
		this.pcategory_no = pcategory_no;
	}

	public String getPcategory_name() {
		return pcategory_name;
	}

	public void setPcategory_name(String pcategory_name) {
		this.pcategory_name = pcategory_name;
	}

	public String getSub_pcategory_name() {
		return sub_pcategory_name;
	}

	public void setSub_pcategory_name(String sub_pcategory_name) {
		this.sub_pcategory_name = sub_pcategory_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ProductCategory [pcategory_no=" + pcategory_no + ", pcategory_name=" + pcategory_name
				+ ", sub_pcategory_name=" + sub_pcategory_name + "]";
	}

	

	
	
	
}
