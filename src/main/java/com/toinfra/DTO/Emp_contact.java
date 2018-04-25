package com.toinfra.DTO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 개인주소록 매핑에 대한 DTO
 */

public class Emp_contact {
	private String emp_no;
	private String contact_no;
	private String groups;

	public String getUser_id() {
		return emp_no;
	}

	public void setUser_id(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getGroups() {
		return groups;
	}

	public void setGroups(String groups) {
		this.groups = groups;
	}

	@Override
	public String toString() {
		return "Emp_contact [emp_no=" + emp_no + ", contact_no=" + contact_no + ", groups=" + groups + "]";
	}
}
