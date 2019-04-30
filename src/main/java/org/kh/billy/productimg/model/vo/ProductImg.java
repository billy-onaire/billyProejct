package org.kh.billy.productimg.model.vo;

import java.io.Serializable;

public class ProductImg implements Serializable {
	private static final long serialVersionUID = 4495416994470649801L;
	
	private int img_no;
	private String first_img;
	private String second_img;
	private String third_img;
	private String fourth_img;
	public ProductImg(int img_no, String first_img, String second_img, String third_img, String fourth_img) {
		super();
		this.img_no = img_no;
		this.first_img = first_img;
		this.second_img = second_img;
		this.third_img = third_img;
		this.fourth_img = fourth_img;
	}
	
	public ProductImg() {}

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	public String getFirst_img() {
		return first_img;
	}

	public void setFirst_img(String first_img) {
		this.first_img = first_img;
	}

	public String getSecond_img() {
		return second_img;
	}

	public void setSecond_img(String second_img) {
		this.second_img = second_img;
	}

	public String getThird_img() {
		return third_img;
	}

	public void setThird_img(String third_img) {
		this.third_img = third_img;
	}

	public String getFourth_img() {
		return fourth_img;
	}

	public void setFourth_img(String fourth_img) {
		this.fourth_img = fourth_img;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ProductImg [img_no=" + img_no + ", first_img=" + first_img + ", second_img=" + second_img
				+ ", third_img=" + third_img + ", fourth_img=" + fourth_img + "]";
	}
	
	
	
}
