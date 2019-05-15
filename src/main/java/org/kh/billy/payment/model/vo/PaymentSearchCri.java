package org.kh.billy.payment.model.vo;

import java.io.Serializable;

import org.springframework.web.util.UriComponentsBuilder;

public class PaymentSearchCri extends PaymentCri implements Serializable {
	private static final long serialVersionUID = -7952725067099699077L;
	
	private String searchType;
	private String keyword;
	
	public PaymentSearchCri() {
		this.searchType = null;
		this.keyword = null;
	}

	public PaymentSearchCri(String searchType, String keyword) {
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
	
	public String makeSearchUri() {
    	UriComponentsBuilder uri = UriComponentsBuilder.newInstance()
    			.queryParam("page", getPage())
				.queryParam("pagePageNum", getPerPageNum());
    	if(searchType != null) {
    		uri
    		.queryParam("searchType", this.searchType)
    		.queryParam("keyword", this.keyword);
    	}
    	return uri.build().encode().toString();
    }

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PaymentSearchCri [searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
