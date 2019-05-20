package org.kh.billy.report.model.vo;

public class ReportSetting {
	
	private int listCount;
	private int page;
	private int startPage;
	private int endPage;
	private int totalPage;
	private int totalCount;
	private int startList;
	private int endList;
	
	public ReportSetting() {
	}

	public ReportSetting(int listCount, int page, int startPage, int endPage, int totalPage, int totalCount,
			int startList, int endList) {
		super();
		this.listCount = listCount;
		this.page = page;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
		this.startList = startList;
		this.endList = endList;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
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

	@Override
	public String toString() {
		return "ReportSetting [listCount=" + listCount + ", page=" + page + ", startPage=" + startPage + ", endPage="
				+ endPage + ", totalPage=" + totalPage + ", totalCount=" + totalCount + ", startList=" + startList
				+ ", endList=" + endList + "]";
	}
	
		
}
