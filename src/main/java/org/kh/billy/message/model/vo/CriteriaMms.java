package org.kh.billy.message.model.vo;

import org.springframework.stereotype.Component;

@Component
public class CriteriaMms implements java.io.Serializable{
    
    /**
	 * 
	 */
	private static final long serialVersionUID = -301846648785976478L;
	private int page;
    private int perPageNum;
    private String recv_id;
    private String sent_id;
    


	public String getRecv_id() {
		return recv_id;
	}

	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}

	public String getSent_id() {
		return sent_id;
	}

	public void setSent_id(String sent_id) {
		this.sent_id = sent_id;
	}

	public int getPageStart() {
        return (this.page-1)*perPageNum;
    }
    
    public CriteriaMms() {
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
    /*public void setPerPageNum(int pageCount) {
        int cnt = this.perPageNum;
        if(pageCount != cnt) {
            this.perPageNum = cnt;
        } else {
            this.perPageNum = pageCount;
        }
    }*/

    public void setPerPageNum(int perPageNum) {
		
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}

	@Override
	public String toString() {
		return "CriteriaMms [page=" + page + ", perPageNum=" + perPageNum + ", recv_id=" + recv_id + ", sent_id="
				+ sent_id + "]";
	}

}
