package org.kh.billy.product.model.vo;

public class Criteria {
    
    private int page;
    private int perPageNum;
    private String seller_id;
    
    public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public int getPageStart() {
        return (this.page-1)*perPageNum;
    }
    
    public Criteria() {
        this.page = 1;
        this.perPageNum = 10;
    }
    
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
    public int getPerPageNum() {
        return perPageNum;
    }
    public void setPerPageNum(int pageCount) {
        int cnt = this.perPageNum;
        if(pageCount != cnt) {
            this.perPageNum = cnt;
        } else {
            this.perPageNum = pageCount;
        }
    }

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", seller_id=" + seller_id + "]";
	}
    
}
