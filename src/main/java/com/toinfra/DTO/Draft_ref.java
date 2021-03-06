package com.toinfra.DTO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	전자결재 참조자에 대한 DTO
**/

public class Draft_ref {
	private String draft_no;
	private String emp_no;
	private String emp_name;
	
	private String position_name;
	private String branch_name;
	private String dept_name;
	private String low_dept_name;
	
	
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
	
	public String getUser_id() {
		return emp_no;
	}
	
	public void setUser_id(String emp_no) {
		this.emp_no = emp_no;
	}

	@Override
	public String toString() {
		return "Draft_ref [draft_no=" + draft_no + ", emp_no=" + emp_no + ", emp_name=" + emp_name + ", position_name="
				+ position_name + ", branch_name=" + branch_name + ", dept_name=" + dept_name + ", low_dept_name="
				+ low_dept_name + "]";
	}
}
