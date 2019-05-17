package org.kh.billy.member.model.vo;

public class Paging {		//페이징 처리VO
	
	private BasePage bPage;
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int viewPageNum = 5;
	
	public BasePage getBPage() {
		return bPage;
	}
	public void setBpage(BasePage bPage) {
		this.bPage = bPage;
	} 
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPage();
	}
	
	private void calcPage() {
		endPage = (int)(Math.ceil(bPage.getPage() / (double)viewPageNum) * viewPageNum);
		int tempEndPage = (int)(Math.ceil(totalCount / (double)bPage.getOnePageNum()));
		startPage = (endPage - viewPageNum) + 1;
		
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		if(startPage <= 0) {
			startPage = 1;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * bPage.getOnePageNum() >= totalCount ? false : true;
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
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getViewPageNum() {
		return viewPageNum;
	}
	public void setViewPageNum(int viewPageNum) {
		this.viewPageNum = viewPageNum;
	}
	@Override
	public String toString() {
		return "Paging [bPage=" + bPage + ", totalCount=" + totalCount + ", startPage=" + startPage + ", endPage="
				+ endPage + ", prev=" + prev + ", next=" + next + ", viewPageNum=" + viewPageNum + "]";
	}
	
}
