package org.kh.billy.product.model.vo;

import java.io.Serializable;
import java.util.Arrays;

import org.springframework.stereotype.Component;
@Component
public class SettingList implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6511713289487817466L;
	
	private String pcategory_name;
	private int[] sub_pcategory_no;
	private int listCount;
	private int minPrice;
	private int maxPrice;
	private String sort;
	private int page;
	private int startPage;
	private int endPage;
	private int totalPage;
	private int totalCount;
	private int startList;
	private int endList;
	private String keyword;
	
	public SettingList() {
	}

	public SettingList(String pcategory_name, int[] sub_pcategory_no, int listCount, int minPrice, int maxPrice,
			String sort, int page, int startPage, int endPage, int totalPage, int totalCount, int startList,
			int endList, String keyword) {
		super();
		this.pcategory_name = pcategory_name;
		this.sub_pcategory_no = sub_pcategory_no;
		this.listCount = listCount;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.sort = sort;
		this.page = page;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
		this.startList = startList;
		this.endList = endList;
		this.keyword = keyword;
	}

	public String getPcategory_name() {
		return pcategory_name;
	}

	public void setPcategory_name(String pcategory_name) {
		this.pcategory_name = pcategory_name;
	}

	public int[] getSub_pcategory_no() {
		return sub_pcategory_no;
	}

	public void setSub_pcategory_no(int[] sub_pcategory_no) {
		this.sub_pcategory_no = sub_pcategory_no;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "SettingList [pcategory_name=" + pcategory_name + ", sub_pcategory_no="
				+ Arrays.toString(sub_pcategory_no) + ", listCount=" + listCount + ", minPrice=" + minPrice
				+ ", maxPrice=" + maxPrice + ", sort=" + sort + ", page=" + page + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", totalPage=" + totalPage + ", totalCount=" + totalCount + ", startList="
				+ startList + ", endList=" + endList + ", keyword=" + keyword + "]";
	}
	
}
