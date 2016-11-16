package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 사원 이력에 대한 VO
 */

public class Emp_his {
	private String emp_no;
	private String his_no;
	private String cg_no;
	private String regdate;

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getHis_no() {
		return his_no;
	}

	public void setHis_no(String his_no) {
		this.his_no = his_no;
	}

	public String getCg_no() {
		return cg_no;
	}

	public void setCg_no(String cg_no) {
		this.cg_no = cg_no;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Emp_his [emp_no=" + emp_no + ", his_no=" + his_no + ", cg_no=" + cg_no + ", regdate=" + regdate + "]";
	}
}
