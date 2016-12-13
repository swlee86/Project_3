package kr.or.epm.VO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	전자결재에 대한 VO
**/

public class Draft {
	// 전자결재 부분
	private String draft_no;
	private String cg_no;
	private String draft_title;
	private String draft_content;
	private String emp_no;
	private String draft_date;
	private String file_name;
	private String step_no;
	
	//추가  DTO 2016-11-17
	// 구분번호 등등
	private String cg_name; 
    private String step_name; 
    private int step;
    private String rec_del_check;
    private String del_check;
    private String branch_name;
    private String dept_name;
    private String low_dept_name;
    private String emp_name;
    private String position_name;
    
	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getLow_dept_name() {
		return low_dept_name;
	}

	public void setLow_dept_name(String low_dept_name) {
		this.low_dept_name = low_dept_name;
	}

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
	
	public String getCg_no() {
		return cg_no;
	}
	
	public void setCg_no(String cg_no) {
		this.cg_no = cg_no;
	}
	
	public String getDraft_title() {
		return draft_title;
	}
	
	public void setDraft_title(String draft_title) {
		this.draft_title = draft_title;
	}
	
	public String getDraft_content() {
		return draft_content.replace("\r\n","<br>");
	}
	
	public void setDraft_content(String draft_content) {
		this.draft_content = draft_content;
	}
	
	public String getEmp_no() {
		return emp_no;
	}
	
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	
	public String getDraft_date() {
		return draft_date;
	}
	
	public void setDraft_date(String draft_date) {
		this.draft_date = draft_date;
	}
	
	public String getFile_name() {
		return file_name;
	}
	
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
	public String getStep_no() {
		return step_no;
	}
	
	public void setStep_no(String step_no) {
		this.step_no = step_no;
	}
	
	//추가 2016-11-17
	
	public String getCg_name() {
		return cg_name;
	}

	public void setCg_name(String cg_name) {
		this.cg_name = cg_name;
	}

	public String getStep_name() {
		return step_name;
	}

	public void setStep_name(String step_name) {
		this.step_name = step_name;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public String getRec_del_check() {
		return rec_del_check;
	}

	public void setRec_del_check(String rec_del_check) {
		this.rec_del_check = rec_del_check;
	}

	public String getDel_check() {
		return del_check;
	}

	public void setDel_check(String del_check) {
		this.del_check = del_check;
	}

	@Override
	public String toString() {
		return "Draft [draft_no=" + draft_no + ", cg_no=" + cg_no + ", draft_title=" + draft_title + ", draft_content="
				+ draft_content + ", emp_no=" + emp_no + ", draft_date=" + draft_date + ", file_name=" + file_name
				+ ", step_no=" + step_no + ", cg_name=" + cg_name + ", step_name=" + step_name + ", step=" + step
				+ ", rec_del_check=" + rec_del_check + ", del_check=" + del_check + "]";
	}

	
}
