package org.kh.billy.product.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ProductDetail implements java.io.Serializable{

	private static final long serialVersionUID = -3821143328250095788L;

	private int product_no;
	private String product_name;
	private int price;
	private int product_quantity;
	private String product_content;
	private String progress;
	private Date product_startdate;
	private Date product_enddate;
	private String weekend_yn;
	private String weekday_yn;
	private Date product_date;
	private Date product_modifydate;
	private String delete_yn;
	private int category_code;
	private String seller_id;
	private int img_no;
	
	private String location_area;
	private String first_img;
	private String second_img;
	private String third_img;
	private String fourth_img;
	private String pcategory_name;
	private String sub_pcategory_name;
	private String user_name;
	private String user_mobile;
	private String email;
	
	public ProductDetail() {}

	public ProductDetail(int product_no, String product_name, int price, int product_quantity, String product_content,
			String progress, Date product_startdate, Date product_enddate, String weekend_yn, String weekday_yn,
			Date product_date, Date product_modifydate, String delete_yn, int category_code, String seller_id,
			int img_no, String location_area, String first_img, String second_img, String third_img, String fourth_img,
			String pcategory_name, String sub_pcategory_name, String user_name, String user_mobile, String email) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.price = price;
		this.product_quantity = product_quantity;
		this.product_content = product_content;
		this.progress = progress;
		this.product_startdate = product_startdate;
		this.product_enddate = product_enddate;
		this.weekend_yn = weekend_yn;
		this.weekday_yn = weekday_yn;
		this.product_date = product_date;
		this.product_modifydate = product_modifydate;
		this.delete_yn = delete_yn;
		this.category_code = category_code;
		this.seller_id = seller_id;
		this.img_no = img_no;
		this.location_area = location_area;
		this.first_img = first_img;
		this.second_img = second_img;
		this.third_img = third_img;
		this.fourth_img = fourth_img;
		this.pcategory_name = pcategory_name;
		this.sub_pcategory_name = sub_pcategory_name;
		this.user_name = user_name;
		this.user_mobile = user_mobile;
		this.email = email;
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

	public int getProduct_quantity() {
		return product_quantity;
	}

	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public Date getProduct_startdate() {
		return product_startdate;
	}

	public void setProduct_startdate(Date product_startdate) {
		this.product_startdate = product_startdate;
	}

	public Date getProduct_enddate() {
		return product_enddate;
	}

	public void setProduct_enddate(Date product_enddate) {
		this.product_enddate = product_enddate;
	}

	public String getWeekend_yn() {
		return weekend_yn;
	}

	public void setWeekend_yn(String weekend_yn) {
		this.weekend_yn = weekend_yn;
	}

	public String getWeekday_yn() {
		return weekday_yn;
	}

	public void setWeekday_yn(String weekday_yn) {
		this.weekday_yn = weekday_yn;
	}

	public Date getProduct_date() {
		return product_date;
	}

	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}

	public Date getProduct_modifydate() {
		return product_modifydate;
	}

	public void setProduct_modifydate(Date product_modifydate) {
		this.product_modifydate = product_modifydate;
	}

	public String getDelete_yn() {
		return delete_yn;
	}

	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}

	public int getCategory_code() {
		return category_code;
	}

	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	public String getLocation_area() {
		return location_area;
	}

	public void setLocation_area(String location_area) {
		this.location_area = location_area;
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

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_mobile() {
		return user_mobile;
	}

	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ProductDetail [product_no=" + product_no + ", product_name=" + product_name + ", price=" + price
				+ ", product_quantity=" + product_quantity + ", product_content=" + product_content + ", progress="
				+ progress + ", product_startdate=" + product_startdate + ", product_enddate=" + product_enddate
				+ ", weekend_yn=" + weekend_yn + ", weekday_yn=" + weekday_yn + ", product_date=" + product_date
				+ ", product_modifydate=" + product_modifydate + ", delete_yn=" + delete_yn + ", category_code="
				+ category_code + ", seller_id=" + seller_id + ", img_no=" + img_no + ", location_area=" + location_area
				+ ", first_img=" + first_img + ", second_img=" + second_img + ", third_img=" + third_img
				+ ", fourth_img=" + fourth_img + ", pcategory_name=" + pcategory_name + ", sub_pcategory_name="
				+ sub_pcategory_name + ", user_name=" + user_name + ", user_mobile=" + user_mobile + ", email=" + email
				+ "]";
	}

	
	
}
