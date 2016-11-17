package kr.or.epm.VO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	전자결재 결재라인에 대한 VO
**/
public class Draft_line {
	private String draft_no;
	private String emp_no;
	private String app_check;
	private String app_date;
	
	
	
	//추가 DTO 2016-11-17
	private String position_no;
	private String position_name;
	private int step;
	private String low_dept_no;
	private int salary;
	private String emp_name;
	private String birth;
	private String pic;
	private String email;
	private String cell_phone;
	private String emp_tel;
	private String emp_break;
	private String cg_no;
	
	public String getDraft_no() {
		return draft_no;
	}
	
	public void setDraft_no(String draft_no) {
		this.draft_no = draft_no;
	}
	
	public String getEmp_no() {
		return emp_no;
	}
	
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	
	public String getApp_check() {
		return app_check;
	}
	
	public void setApp_check(String app_check) {
		this.app_check = app_check;
	}
	
	public String getApp_date() {
		return app_date;
	}
	
	public void setApp_date(String app_date) {
		this.app_date = app_date;
	}

	public String getPosition_no() {
		return position_no;
	}

	public void setPosition_no(String position_no) {
		this.position_no = position_no;
	}

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public String getLow_dept_no() {
		return low_dept_no;
	}

	public void setLow_dept_no(String low_dept_no) {
		this.low_dept_no = low_dept_no;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCell_phone() {
		return cell_phone;
	}

	public void setCell_phone(String cell_phone) {
		this.cell_phone = cell_phone;
	}

	public String getEmp_tel() {
		return emp_tel;
	}

	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}

	public String getEmp_break() {
		return emp_break;
	}

	public void setEmp_break(String emp_break) {
		this.emp_break = emp_break;
	}

	public String getCg_no() {
		return cg_no;
	}

	public void setCg_no(String cg_no) {
		this.cg_no = cg_no;
	}

	@Override
	public String toString() {
		return "Draft_line [draft_no=" + draft_no + ", emp_no=" + emp_no + ", app_check=" + app_check + ", app_date="
				+ app_date + ", position_no=" + position_no + ", position_name=" + position_name + ", step=" + step
				+ ", low_dept_no=" + low_dept_no + ", salary=" + salary + ", emp_name=" + emp_name + ", birth=" + birth
				+ ", pic=" + pic + ", email=" + email + ", cell_phone=" + cell_phone + ", emp_tel=" + emp_tel
				+ ", emp_break=" + emp_break + ", cg_no=" + cg_no + "]";
	}

	
}
