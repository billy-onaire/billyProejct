package org.kh.billy.member.model.vo;

public class BasePage {		//특정 페이지 조회 VO
	private int page;		//현재 페이지번호
	private int onePageNum;		//한 페이지당 보여줄 게시글 갯수
	private int rowStart;  //한 페이지당 보여줄 게시글 첫글
	private int rowEnd;	  //한 페이지당 보여줄 게시글 마지막글
	
	public int getPageStart() {
		return (this.page - 1) * onePageNum;
	}
	
	public BasePage() {
		this.page = 1;
		this.onePageNum = 10;
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
	
	public int getOnePageNum() {
		return onePageNum;
	}
	
	public void setOnePageNum(int pageCount) {
		int pcnt = this.onePageNum;
		if(pageCount != pcnt) {
			this.onePageNum = pcnt;
		} else {
			this.onePageNum = pageCount;
		}
	}

	public int getRowStart() {
		rowStart = ((page - 1) * onePageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + onePageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "BasePage [page=" + page + ", onePageNum=" + onePageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	
}
