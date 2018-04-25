package com.toinfra.DTO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 사원 권한에 대한 DTO
 */

public class Emp_role {

	private String role_no;
	private String emp_no;
	private String role_name;
	private String role_exp;
	
	public String getRole_exp() {
		return role_exp;
	}

	public void setRole_exp(String role_exp) {
		this.role_exp = role_exp;
	}

	public String getRole_no() {
		return role_no;
	}

	public void setRole_no(String role_no) {
		this.role_no = role_no;
	}

	public String getUser_id() {
		return emp_no;
	}

	public void setUser_id(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	@Override
	public String toString() {
		return "Emp_role [role_no=" + role_no + ", emp_no=" + emp_no + ", role_name=" + role_name + "]";
	}
}
