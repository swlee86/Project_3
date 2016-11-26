package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 사원에 대한 VO
 */

public class Emp {
	private String emp_no;
	private String cg_no;
	private String position_no;
	private String low_dept_no;
	private String emp_break;
	private int salary;
	private String emp_name;
	private String birth;
	private String pic;
	private String email;
	private String cell_phone;
	private String emp_tel;
	private String branch_name;
	private String dept_name;
	private String low_dept_name;
	
	private String cg_name;
	private String position_name;
	
	public String getCg_name() {
		return cg_name;
	}

	public void setCg_name(String cg_name) {
		this.cg_name = cg_name;
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
	
	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getCg_no() {
		return cg_no;
	}

	public void setCg_no(String cg_no) {
		this.cg_no = cg_no;
	}

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

	public String getEmp_break() {
		return emp_break;
	}

	public void setEmp_break(String emp_break) {
		this.emp_break = emp_break;
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

	@Override
	public String toString() {
		return "Emp [emp_no=" + emp_no + ", cg_no=" + cg_no + ", position_no=" + position_no + ", low_dept_no="
				+ low_dept_no + ", emp_break=" + emp_break + ", salary=" + salary + ", emp_name=" + emp_name
				+ ", birth=" + birth + ", pic=" + pic + ", email=" + email + ", cell_phone=" + cell_phone + ", emp_tel="
				+ emp_tel + ", position_name=" + position_name + "]";
	}
}
