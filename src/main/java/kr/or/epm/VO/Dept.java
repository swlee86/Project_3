package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 부서에 대한 VO
 */

public class Dept {
	private String dept_no;
	private String branch_no;
	private String branch_name;
	private String dept_name;
	private String pre_dept_no;
	private String his_check;
	private int depth;

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

	public String getPre_dept_no() {
		return pre_dept_no;
	}

	public void setPre_dept_no(String pre_dept_no) {
		this.pre_dept_no = pre_dept_no;
	}

	public String getHis_check() {
		return his_check;
	}

	public void setHis_check(String his_check) {
		this.his_check = his_check;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	@Override
	public String toString() {
		return "Dept [dept_no=" + dept_no + ", branch_no=" + branch_no + ", branch_name=" + branch_name + ", dept_name="
				+ dept_name + ", pre_dept_no=" + pre_dept_no + ", his_check=" + his_check + ", depth=" + depth + "]";
	}
}