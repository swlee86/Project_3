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
				+ emp_tel + "]";
	}
}
