package org.kh.billy.product.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;
@Component
public class SettingList implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6511713289487817466L;
	
	private String pcategory_name;
	private String sub_pcategory_name;
	private int page;
	
	public SettingList() {
		// TODO Auto-generated constructor stub
	}
	
	public SettingList(String pcategory_name, String sub_pcategory_name, int page) {
		super();
		this.pcategory_name = pcategory_name;
		this.sub_pcategory_name = sub_pcategory_name;
		this.page = page;
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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return pcategory_name + ", " + sub_pcategory_name + ", " + page;
	}
	
	
}
