package com.toinfra.DTO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 사원 상세에 대한 DTO
 */

public class Emp_detail {
	private String user_id;
	private String pwd;
	private String team_code;
	private String credential_id;
	private String googleapiid;
	private String email;
	private String alive;
	private String position_no;
	private String low_dept_no;
	private String user_name;
	private String salary;
	private String emp_break;
	private String cell_phone;

	public String getPosition_no() {
		return position_no;
	}

	public void setPosition_no(String position_no) {
		this.position_no = position_no;
	}

	public String getLow_dept_no() {
		return low_dept_no;
	}

	public void setLow_dept_no(String low_dept_no) {
		this.low_dept_no = low_dept_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getEmp_break() {
		return emp_break;
	}

	public void setEmp_break(String emp_break) {
		this.emp_break = emp_break;
	}

	public String getCell_phone() {
		return cell_phone;
	}

	public void setCell_phone(String cell_phone) {
		this.cell_phone = cell_phone;
	}

	public String getAlive() {
		return alive;
	}

	public void setAlive(String alive) {
		this.alive = alive;
	}

	public String getCredential_id() {
		return credential_id;
	}

	public void setCredential_id(String credential_id) {
		this.credential_id = credential_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTeam_code() {
		return team_code;
	}

	public void setTeam_code(String team_code) {
		this.team_code = team_code;
	}

	public String getGoogleapiid() {
		return googleapiid;
	}

	public void setGoogleapiid(String googleapiid) {
		this.googleapiid = googleapiid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Emp_detail{" +
				"user_id='" + user_id + '\'' +
				", pwd='" + pwd + '\'' +
				", team_code='" + team_code + '\'' +
				", credential_id='" + credential_id + '\'' +
				", googleapiid='" + googleapiid + '\'' +
				", email='" + email + '\'' +
				", alive='" + alive + '\'' +
				", position_no='" + position_no + '\'' +
				", low_dept_no='" + low_dept_no + '\'' +
				", user_name='" + user_name + '\'' +
				", salary='" + salary + '\'' +
				", emp_break='" + emp_break + '\'' +
				", cell_phone='" + cell_phone + '\'' +
				'}';
	}
}
