package org.kh.billy.visit.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Visit implements java.io.Serializable{

	private static final long serialVersionUID = -8238321964199136605L;

	private int visit_id;
	private String v_date;
	private String visitCount;
	private String totalVisitCount;

	public Visit() {}

	public Visit(int visit_id, String v_date, String visitCount, String totalVisitCount) {
		super();
		this.visit_id = visit_id;
		this.v_date = v_date;
		this.visitCount = visitCount;
		this.totalVisitCount = totalVisitCount;
	}

	public int getVisit_id() {
		return visit_id;
	}

	public void setVisit_id(int visit_id) {
		this.visit_id = visit_id;
	}

	public String getV_date() {
		return v_date;
	}

	public void setV_date(String v_date) {
		this.v_date = v_date;
	}

	public String getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(String visitCount) {
		this.visitCount = visitCount;
	}

	public String getTotalVisitCount() {
		return totalVisitCount;
	}

	public void setTotalVisitCount(String totalVisitCount) {
		this.totalVisitCount = totalVisitCount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Visit [visit_id=" + visit_id + ", v_date=" + v_date + ", visitCount=" + visitCount
				+ ", totalVisitCount=" + totalVisitCount + "]";
	}
	
}

