package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-22
 * 작성자 : 백승아
 * 사용 목적 : 공통적으로 사용되는 VO
 */

public class Common {

	private String branch_name;
	private String dept_name;
	private String low_dept_name;
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

	@Override
	public String toString() {
		return "Common [branch_name=" + branch_name + ", dept_name=" + dept_name + ", low_dept_name=" + low_dept_name
				+ "]";
	}
}
