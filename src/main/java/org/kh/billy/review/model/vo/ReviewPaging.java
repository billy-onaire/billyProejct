package org.kh.billy.review.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ReviewPaging implements java.io.Serializable{

	private static final long serialVersionUID = 1313623760600357207L;
	
	private int pageCnt; // 출력할 페이지번호 갯수
	private int index; // 출력할 페이지번호
	private int pageStartNum; // 출력할 페이지 시작 번호
	private int listCnt; // 출력할 리스트 갯수
	private int total; // 리스트 총 갯수
	private String userId; //제품 대여한 사람 id
	
	{
		pageCnt = 5;
		index = 0;
		pageStartNum = 1;
		listCnt = 5;
	}

	public ReviewPaging() {}

	
	
	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public int getStart() {
		return index * listCnt + 1;
	}

	public int getLast() {
		return (index * listCnt) + listCnt;
	}

	public int getPageLastNum() {
		int remainListCnt = total - listCnt * (pageStartNum - 1);
		int remainPageCnt = remainListCnt / listCnt;
		if (remainListCnt % listCnt != 0) {
			remainPageCnt++;
		}
		int pageLastNum = 0;
		if (remainListCnt <= listCnt) {
			pageLastNum = pageStartNum;
		} else if (remainPageCnt <= pageCnt) {
			pageLastNum = remainPageCnt + pageStartNum - 1;
		} else {
			pageLastNum = pageCnt + pageStartNum - 1;
		}
		return pageLastNum;
	}

	public boolean getLastChk() {
		int n = (int) Math.ceil((double) total / listCnt);
		return getPageLastNum() == n ? false : n == 0 ? false : true;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getPageStartNum() {
		return pageStartNum;
	}

	public void setPageStartNum(int pageStartNum) {
		this.pageStartNum = pageStartNum;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "PagingDto [pageCnt=" + pageCnt + ", index=" + index + ", pageStartNum=" + pageStartNum + ", listCnt="
				+ listCnt + ", total=" + total + "]";
	}
}
