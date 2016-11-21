package kr.or.epm.VO;

public class EmployeeManage {
	private String emp_no;
	private String emp_name;
	private String cg_name;
	private String branch_name;
	private String dept_name;
	private String low_dept_name;
	private String position_name;
	private String rn;
	private String id;
	private String cell_phone;
	private String birth;
	private int salary;
	private int emp_break;
	
	
	
	
	public int getEmp_break() {
		return emp_break;
	}
	public void setEmp_break(int emp_break) {
		this.emp_break = emp_break;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
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
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCell_phone() {
		return cell_phone;
	}
	public void setCell_phone(String cell_phone) {
		this.cell_phone = cell_phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	
	
	@Override
	public String toString() {
		return "EmployeeManage [emp_no=" + emp_no + ", emp_name=" + emp_name + ", cg_name=" + cg_name + ", branch_name="
				+ branch_name + ", dept_name=" + dept_name + ", low_dept_name=" + low_dept_name + ", position_name="
				+ position_name + ", rn=" + rn + ", id=" + id + ", cell_phone=" + cell_phone + ", birth=" + birth
				+ ", salary=" + salary + ", emp_break=" + emp_break + "]";
	}
	
	
	
	
	
}
