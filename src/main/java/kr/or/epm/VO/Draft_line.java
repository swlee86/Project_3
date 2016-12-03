package kr.or.epm.VO;

/*
 * 작성일 : 2016 - 11 - 16 
 * 작성자 : 김주희 
 * 사용 목적 : 전자결재 결재라인에 대한 VO
 */

public class Draft_line {
	private String draft_no;
	private String emp_no;
	private String app_check;
	private String app_date;
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

	public String getApp_check() {
		return app_check;
	}

	public void setApp_check(String app_check) {
		this.app_check = app_check;
	}

	public String getApp_date() {
		return app_date;
	}

	public void setApp_date(String app_date) {
		this.app_date = app_date;
	}

	@Override
	public String toString() {
		return "Draft_line [draft_no=" + draft_no + ", emp_no=" + emp_no + ", app_check=" + app_check + ", app_date="
				+ app_date + "]";
	}
}
