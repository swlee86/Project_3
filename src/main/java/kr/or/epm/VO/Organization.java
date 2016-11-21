package kr.or.epm.VO;

public class Organization {

	private String branch_name;
	private String dept_name;
	private String low_dept_name;
	private String emp_name;
	private int depth0;
	private int depth1;
	private int depth2;
	private String emp_no;

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

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	@Override
	public String toString() {
		return "Organization [branch_name=" + branch_name + ", dept_name=" + dept_name + ", low_dept_name="
				+ low_dept_name + ", emp_name=" + emp_name + ", depth0=" + depth0 + ", depth1=" + depth1 + ", depth2="
				+ depth2 + ", emp_no=" + emp_no + "]";
	}
}
