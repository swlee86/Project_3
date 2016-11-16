package kr.or.epm.VO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	협조문에 대한 VO
**/
public class Cooperation {
	private String draft_no;
	private String low_dept_no;
	
	public String getDraft_no() {
		return draft_no;
	}
	
	public void setDraft_no(String draft_no) {
		this.draft_no = draft_no;
	}
	
	public String getLow_dept_no() {
		return low_dept_no;
	}
	
	public void setLow_dept_no(String low_dept_no) {
		this.low_dept_no = low_dept_no;
	}

	@Override
	public String toString() {
		return "Cooperation [draft_no=" + draft_no + ", low_dept_no=" + low_dept_no + "]";
	}
}
