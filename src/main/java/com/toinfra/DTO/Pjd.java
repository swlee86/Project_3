package com.toinfra.DTO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 프로젝트 상세에 대한 DTO
 */

public class Pjd {
	private String pjd_no;
	private String pj_no;
	private String pjd_title;
	private String pjd_content;
	private String pjd_start;
	private String pjd_end;
	private String pj_step_no;
	private int rownum;
	private String emp_name;
	private String emp_no;
	private String pj_step_name;
	private String rec_emp_no;
	private String pjd_progress;
	
	public String getRec_emp_no() {
		return rec_emp_no;
	}

	public void setRec_emp_no(String rec_emp_no) {
		this.rec_emp_no = rec_emp_no;
	}

	public String getUser_id() {
		return emp_no;
	}

	public void setUser_id(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getPjd_no() {
		return pjd_no;
	}

	public void setPjd_no(String pjd_no) {
		this.pjd_no = pjd_no;
	}

	public String getPj_no() {
		return pj_no;
	}

	public void setPj_no(String pj_no) {
		this.pj_no = pj_no;
	}

	public String getPjd_title() {
		return pjd_title;
	}

	public void setPjd_title(String pjd_title) {
		this.pjd_title = pjd_title;
	}

	public String getPjd_content() {
		return pjd_content;
	}

	public void setPjd_content(String pjd_content) {
		this.pjd_content = pjd_content;
	}

	public String getPjd_start() {
		return pjd_start;
	}

	public void setPjd_start(String pjd_start) {
		this.pjd_start = pjd_start;
	}

	public String getPjd_end() {
		return pjd_end;
	}

	public void setPjd_end(String pjd_end) {
		this.pjd_end = pjd_end;
	}

	public String getPj_step_no() {
		return pj_step_no;
	}

	public void setPj_step_no(String pj_step_no) {
		this.pj_step_no = pj_step_no;
	}

	
	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	
	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getPj_step_name() {
		return pj_step_name;
	}

	public void setPj_step_name(String pj_step_name) {
		this.pj_step_name = pj_step_name;
	}

	public String getPjd_progress() {
		return pjd_progress;
	}

	public void setPjd_progress(String pjd_progress) {
		this.pjd_progress = pjd_progress;
	}

	@Override
	public String toString() {
		return "Pjd [pjd_no=" + pjd_no + ", pj_no=" + pj_no + ", pjd_title=" + pjd_title + ", pjd_content="
				+ pjd_content + ", pjd_start=" + pjd_start + ", pjd_end=" + pjd_end + ", pj_step_no=" + pj_step_no
				+ ", rownum=" + rownum + ", emp_name=" + emp_name + ", emp_no=" + emp_no + ", pj_step_name="
				+ pj_step_name + ", rec_emp_no=" + rec_emp_no + ", pjd_progress=" + pjd_progress + "]";
	}
}
