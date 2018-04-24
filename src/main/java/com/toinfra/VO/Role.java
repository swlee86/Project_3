package com.toinfra.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : Spring Security의 권한부여에 대한 VO
 */

public class Role {
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

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
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
		return "Role [role_no=" + role_no + ", emp_no=" + emp_no + ", role_name=" + role_name + ", role_exp=" + role_exp
				+ "]";
	}
}
