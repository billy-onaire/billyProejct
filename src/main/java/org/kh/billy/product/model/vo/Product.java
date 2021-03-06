package org.kh.billy.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class Product implements Serializable{

	/**
PRODUCT_CODE	NUMBER
PRODUCT_NAME	VARCHAR2(100 BYTE)
PRICE	NUMBER
PRODUCT_QUANTITY	NUMBER
PRODUCT_CONTENT	VARCHAR2(3000 BYTE)
PROGRESS	CHAR(1 BYTE)
PRODUCT_STARTDATE	DATE
PRODUCT_ENDDATE	DATE
WEEKEND_YN	VARCHAR2(10 BYTE)
WEEKDAY_YN	VARCHAR2(100 BYTE)
PRODUCT_DATE	DATE
PRODUCT_MODIFYDATE	DATE
DELETE_YN	VARCHAR2(10 BYTE)
CATEGORY_CODE	NUMBER
SELLER_ID	VARCHAR2(100 BYTE)
USER_ID	VARCHAR2(50 BYTE)
	 */
	private static final long serialVersionUID = 3708339374204180142L;

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
	private String datecal;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public String getDatecal() {
		return datecal;
	}

	public void setDatecal(String datecal) {
		this.datecal = datecal;
	}

	public Product(int product_no, String product_name, int price, int product_quantity, String product_content,
			String progress, Date product_startdate, Date product_enddate, String weekend_yn, String weekday_yn,
			Date product_date, Date product_modifydate, String delete_yn, int category_code, String seller_id,
			int img_no) {
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Product [product_no=" + product_no + ", product_name=" + product_name + ", price=" + price
				+ ", product_quantity=" + product_quantity + ", product_content=" + product_content + ", progress="
				+ progress + ", product_startdate=" + product_startdate + ", product_enddate=" + product_enddate
				+ ", weekend_yn=" + weekend_yn + ", weekday_yn=" + weekday_yn + ", product_date=" + product_date
				+ ", product_modifydate=" + product_modifydate + ", delete_yn=" + delete_yn + ", category_code="
				+ category_code + ", seller_id=" + seller_id + ", img_no=" + img_no + "]";
	}
}
