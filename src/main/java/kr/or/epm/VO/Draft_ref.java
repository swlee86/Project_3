package kr.or.epm.VO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	전자결재 참조자에 대한 VO
**/
public class Draft_ref {
	private String draft_no;
	private String emp_no;
	private String emp_name;
	
	
	
	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getDraft_no() {
		return draft_no;
	}
	
	public void setDraft_no(String draft_no) {
		this.draft_no = draft_no;
	}
	
	public String getEmp_no() {
		return emp_no;
	}
	
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	
	@Override
	public String toString() {
		return "Draft_ref [draft_no=" + draft_no + ", emp_no=" + emp_no + "]";
	}
}
