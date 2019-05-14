package org.kh.billy.payment.model.vo;

import java.io.Serializable;

public class PaymentSearchCri extends PaymentCri implements Serializable {
	private static final long serialVersionUID = -7952725067099699077L;
	
	private String searchType;
	private String keyword;
	
	public PaymentSearchCri() {}

	public PaymentSearchCri(String searchType, String keyword) {
		super();
		this.searchType = searchType;
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
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
		return "PaymentSearchCri [searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
