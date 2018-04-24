package com.toinfra.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 프로젝트에 대한 VO
 *
 * 수정일 : 2016-11-22
 * 작성자 : 김주희
 */

public class Pj {
	private String pj_no;
	private String emp_no;
	private String pj_title;
	private String pj_content;
	private String pj_start;
	private String pj_end;
	private int pj_progress;
	private String pj_step_no;
	private String step_no;
	private String emp_name;
	private String pj_step_name;
	private String dept_name;
	private String rec_emp_no;
	private String rec_emp_name;
	
	public String getRec_emp_no() {
		return rec_emp_no;
	}

	public void setRec_emp_no(String rec_emp_no) {
		this.rec_emp_no = rec_emp_no;
	}

	public String getRec_emp_name() {
		return rec_emp_name;
	}

	public void setRec_emp_name(String rec_emp_name) {
		this.rec_emp_name = rec_emp_name;
	}

	public String getPj_no() {
		return pj_no;
	}

	public void setPj_no(String pj_no) {
		this.pj_no = pj_no;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getPj_title() {
		return pj_title;
	}

	public void setPj_title(String pj_title) {
		this.pj_title = pj_title;
	}

	public String getPj_content() {
		return pj_content;
	}

	public void setPj_content(String pj_content) {
		this.pj_content = pj_content;
	}

	public String getPj_start() {
		return pj_start;
	}

	public void setPj_start(String pj_start) {
		this.pj_start = pj_start;
	}

	public String getPj_end() {
		return pj_end;
	}

	public void setPj_end(String pj_end) {
		this.pj_end = pj_end;
	}

	public int getPj_progress() {
		return pj_progress;
	}

	public void setPj_progress(int pj_progress) {
		this.pj_progress = pj_progress;
	}

	public String getPj_step_no() {
		return pj_step_no;
	}

	public void setPj_step_no(String pj_step_no) {
		this.pj_step_no = pj_step_no;
	}

	public String getStep_no() {
		return step_no;
	}

	public void setStep_no(String step_no) {
		this.step_no = step_no;
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

	
	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	@Override
	public String toString() {
		return "Pj [pj_no=" + pj_no + ", emp_no=" + emp_no + ", pj_title=" + pj_title + ", pj_content=" + pj_content
				+ ", pj_start=" + pj_start + ", pj_end=" + pj_end + ", pj_progress=" + pj_progress + ", pj_step_no="
				+ pj_step_no + ", step_no=" + step_no + ", emp_name=" + emp_name + ", pj_step_name=" + pj_step_name
				+ ", dept_name=" + dept_name + ", rec_emp_no=" + rec_emp_no + ", rec_emp_name=" + rec_emp_name + "]";
	}
}
