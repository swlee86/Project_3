package com.toinfra.DTO;

/**
 * 작성일 : 2016 - 11 - 16 작성자 : 김주희 사용 목적 : 휴가신청에 대한 DTO
 **/
public class Break {
	private String draft_no;
	private String break_start;
	private String break_end;
	private String break_term;
	private String break_cg_no;

	// 추가 DTO 2016-11-17
	private String break_cg_name;

	// 추가 DTO 2016-11-18
	private String cg_no;
	private String draft_title;
	private String draft_content;
	private String emp_no;
	private String draft_date;
	private String file_name;
	private String step_no;
	private String rec_del_check;
	private String del_check;

	private String emp_name;
	private String rec_check;
	private String position_name;
	private String branch_name;
	private String dept_name;
	private String low_dept_name;
	private String cell_phone;
	
	private String break_tel;
	
	public String getBreak_tel() {
		return break_tel;
	}

	public void setBreak_tel(String break_tel) {
		this.break_tel = break_tel;
	}

	public String getCell_phone() {
		return cell_phone;
	}

	public void setCell_phone(String cell_phone) {
		this.cell_phone = cell_phone;
	}

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

	public String getRec_check() {
		return rec_check;
	}

	public void setRec_check(String rec_check) {
		this.rec_check = rec_check;
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

	public String getBreak_start() {
		return break_start;
	}

	public void setBreak_start(String break_start) {
		this.break_start = break_start;
	}

	public String getBreak_end() {
		return break_end;
	}

	public void setBreak_end(String break_end) {
		this.break_end = break_end;
	}

	public String getBreak_term() {
		return break_term;
	}

	public void setBreak_term(String break_term) {
		this.break_term = break_term;
	}

	public String getBreak_cg_no() {
		return break_cg_no;
	}

	public void setBreak_cg_no(String break_cg_no) {
		this.break_cg_no = break_cg_no;
	}

	public String getBreak_cg_name() {
		return break_cg_name;
	}

	public void setBreak_cg_name(String break_cg_name) {
		this.break_cg_name = break_cg_name;
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

	public String getUser_id() {
		return emp_no;
	}

	public void setUser_id(String emp_no) {
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
		return "Break [draft_no=" + draft_no + ", break_start=" + break_start + ", break_end=" + break_end
				+ ", break_term=" + break_term + ", break_cg_no=" + break_cg_no + ", break_cg_name=" + break_cg_name
				+ ", cg_no=" + cg_no + ", draft_title=" + draft_title + ", draft_content=" + draft_content + ", emp_no="
				+ emp_no + ", draft_date=" + draft_date + ", file_name=" + file_name + ", step_no=" + step_no
				+ ", rec_del_check=" + rec_del_check + ", del_check=" + del_check + ", emp_name=" + emp_name
				+ ", rec_check=" + rec_check + ", position_name=" + position_name + ", branch_name=" + branch_name
				+ ", dept_name=" + dept_name + ", low_dept_name=" + low_dept_name + ", cell_phone=" + cell_phone
				+ ", break_tel=" + break_tel + "]";
	}

}
