package kr.or.epm.VO;

public class Pjd_people {
	private String pj_no;
	private String pjd_no;
	private String emp_no;

	public String getPj_no() {
		return pj_no;
	}

	public void setPj_no(String pj_no) {
		this.pj_no = pj_no;
	}

	public String getPjd_no() {
		return pjd_no;
	}

	public void setPjd_no(String pjd_no) {
		this.pjd_no = pjd_no;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	@Override
	public String toString() {
		return "Pjd_people [pj_no=" + pj_no + ", pjd_no=" + pjd_no + ", emp_no=" + emp_no + "]";
	}
}
