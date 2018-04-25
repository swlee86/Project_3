package com.toinfra.DTO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 프로젝트 상세 참여자에 대한 DTO
 */

public class Pjd_people {
	
	private String pj_no;
	private String pjd_no;
	private String emp_no;
	private String emp_name;
	private String branch_name;
	private String dept_name;
	private String low_dept_name;
	private String cell_phone;
	private String pic;
	
	private String emp_tel;
	private String tel2;
	private String birth;
	private String email;
	
	public String getPj_no() {
		return pj_no;
	}
	
	public void setPj_no(String pj_no) {
		this.pj_no = pj_no;
	}
	
	public String getPjd_no() {
		return pjd_no;
	}
	
	public void setPjd_no(String pjd_no) {
		this.pjd_no = pjd_no;
	}
	
	public String getUser_id() {
		return emp_no;
	}
	
	public void setUser_id(String emp_no) {
		this.emp_no = emp_no;
	}
	
	public String getEmp_name() {
		return emp_name;
	}
	
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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
	
	public String getCell_phone() {
		return cell_phone;
	}
	
	public void setCell_phone(String cell_phone) {
		this.cell_phone = cell_phone;
	}
	
	public String getPic() {
		return pic;
	}
	
	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getEmp_tel() {
		return emp_tel;
	}

	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Pjd_people [pj_no=" + pj_no + ", pjd_no=" + pjd_no + ", emp_no=" + emp_no + ", emp_name=" + emp_name
				+ ", branch_name=" + branch_name + ", dept_name=" + dept_name + ", low_dept_name=" + low_dept_name
				+ ", cell_phone=" + cell_phone + ", pic=" + pic + ", emp_tel=" + emp_tel + ", tel2=" + tel2 + ", birth="
				+ birth + ", email=" + email + "]";
	}
}
