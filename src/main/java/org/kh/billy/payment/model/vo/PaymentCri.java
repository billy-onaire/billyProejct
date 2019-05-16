package org.kh.billy.payment.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponentsBuilder;

@Component
public class PaymentCri implements Serializable{
	private static final long serialVersionUID = -1128740156242207205L;
	
	private int page;
    private int perPageNum;
    private String searchType;
    private String keyword;

	private String seller_id;
    
    public PaymentCri() {
    	this.page = 1;
    	this.perPageNum = 10;
    	this.searchType = null;
    	this.keyword = null;
    }
    
    public void setPage(int page) {
    	if(page <=0 ) 
    		this.page = 1;
    	else
    		this.page = page;
    }
    
    public int getPage() {
    	return page;
    }
    
    public void setPerPageNum(int perPageNum) {
    	if(perPageNum <= 0 || perPageNum > 100)
    		this.perPageNum = 10;
    	else
    		this.perPageNum = perPageNum;
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

	public int getPerPageNum() {
    	return perPageNum;
    }
    
    public int getPageStart() {
    	return (this.page - 1) * perPageNum;
    }

	@Override
	public String toString() {
		return "PaymentCri [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	
	public String getSeller_id() {
		return seller_id;
	}
}
