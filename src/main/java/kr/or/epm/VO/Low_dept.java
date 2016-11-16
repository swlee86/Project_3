package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 하위 부서에 대한 VO
 */

public class Low_dept {
	private String low_dept_no;
	private String dept_no;
	private String branch_name;
	private String dept_name;
	private String low_dept_name;
	private String tel;
	private String fax;
	private String pre_low_dept_no;
	private String his_check;
	private int depth;

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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getPre_low_dept_no() {
		return pre_low_dept_no;
	}

	public void setPre_low_dept_no(String pre_low_dept_no) {
		this.pre_low_dept_no = pre_low_dept_no;
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
		return "Low_dept [low_dept_no=" + low_dept_no + ", dept_no=" + dept_no + ", branch_name=" + branch_name
				+ ", dept_name=" + dept_name + ", low_dept_name=" + low_dept_name + ", tel=" + tel + ", fax=" + fax
				+ ", pre_low_dept_no=" + pre_low_dept_no + ", his_check=" + his_check + ", depth=" + depth + "]";
	}
}
