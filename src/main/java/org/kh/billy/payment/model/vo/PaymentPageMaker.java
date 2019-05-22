package org.kh.billy.payment.model.vo;

import java.io.Serializable;

import org.slf4j.LoggerFactory;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.sun.media.jfxmedia.logging.Logger;

public class PaymentPageMaker implements Serializable {
	private static final long serialVersionUID = -5429107361322228526L;
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(PaymentPageMaker.class);
	
	private int totalCount;     // 게시판 전체 데이터 개수
	private int displayPageNum = 10;   // 게시판 화면에서 한번에 보여질 페이지 번호의 개수 ( 1,2,3,4,5,6,7,9,10)
	
	private int startPage;      // 현재 화면에서 보이는 startPage 번호
	private int endPage;        // 현재 화면에 보이는 endPage 번호
	private boolean prev;       // 페이징 이전 버튼 활성화 여부
	private boolean next;       // 페이징 다음 버튼 활서화 여부
	
	private PaymentCri cri;       // 앞서 생성한 Criteria를 주입받는다.
	
	public PaymentPageMaker(PaymentCri payCri) {
		this.cri = payCri;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
	}
	public String makeSearchUri(int page) {
		UriComponentsBuilder uri = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum());
		
		if(cri.getSearchType() != null) {
			uri
			.queryParam("searchType", cri.getSearchType())
			.queryParam("keyword", cri.getKeyword());
		}
		
		logger.info("searchType : " + cri.getSearchType());
		return uri.build().encode().toString();
	}
	
	private void calcData() {
		int page = this.cri.getPage();
		int perPageNum = this.cri.getPerPageNum();
		
		/*int startPage = (currentPage -1) * pageList + 1;
		int endPage = startRow + pageList - 1;*/
		
		endPage = (int)(Math.ceil(page/(double)displayPageNum)*displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		logger.info("page : " + page);
		logger.info("perPageNum : " + perPageNum);
		logger.info("displayPageNum : " + displayPageNum);
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double)perPageNum));
		
		logger.info("tempEndPage : " + tempEndPage);
		
		if(endPage > tempEndPage)
			this.endPage = tempEndPage;
		
		prev = (startPage != 1);		
		next = (endPage * perPageNum < totalCount);
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

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public PaymentCri getCri() {
		return cri;
	}

	public void setCri(PaymentSearchCri cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}
}
