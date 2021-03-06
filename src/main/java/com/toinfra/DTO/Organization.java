package com.toinfra.DTO;
/*
 * 작성일 : 2016-11-22
 * 작성자 : 이상원, 박성준
 * 사용 목적 : 조직도에 대한 DTO
 */

public class Organization {

	private String branch_name;
	private String dept_name;
	private String low_dept_name;
	private String emp_name;
	private int depth0;
	private int depth1;
	private int depth2;
	private String emp_no;
	
	private String cell_phone;
	private String branch_no;
	private String dept_no;
	private String low_dept_no;
	private String birth;
	private String pic;
	private String email;
	private String emp_tel;
	
	private String fax;
	private String tel;
	
	private String position_name;
	
	
	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmp_tel() {
		return emp_tel;
	}

	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getLow_dept_no() {
		return low_dept_no;
	}

	public void setLow_dept_no(String low_dept_no) {
		this.low_dept_no = low_dept_no;
	}

	public String getDept_no() {
		return dept_no;
	}

	public void setDept_no(String dept_no) {
		this.dept_no = dept_no;
	}

	public String getBranch_no() {
		return branch_no;
	}

	public void setBranch_no(String branch_no) {
		this.branch_no = branch_no;
	}

	public String getCell_phone() {
		return cell_phone;
	}

	public void setCell_phone(String cell_phone) {
		this.cell_phone = cell_phone;
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

	public int getDepth0() {
		return depth0;
	}

	public void setDepth0(int depth0) {
		this.depth0 = depth0;
	}

	public int getDepth1() {
		return depth1;
	}

	public void setDepth1(int depth1) {
		this.depth1 = depth1;
	}

	public int getDepth2() {
		return depth2;
	}

	public void setDepth2(int depth2) {
		this.depth2 = depth2;
	}

	public String getUser_id() {
		return emp_no;
	}

	public void setUser_id(String emp_no) {
		this.emp_no = emp_no;
	}

	@Override
	public String toString() {
		return "Organization [branch_name=" + branch_name + ", dept_name=" + dept_name + ", low_dept_name="
				+ low_dept_name + ", emp_name=" + emp_name + ", depth0=" + depth0 + ", depth1=" + depth1 + ", depth2="
				+ depth2 + ", emp_no=" + emp_no + ", cell_phone=" + cell_phone + ", branch_no=" + branch_no
				+ ", dept_no=" + dept_no + ", low_dept_no=" + low_dept_no + ", birth=" + birth + ", pic=" + pic
				+ ", email=" + email + ", emp_tel=" + emp_tel + ", fax=" + fax + ", tel=" + tel + ", position_name="
				+ position_name + "]";
	}



	

	

}
