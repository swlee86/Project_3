package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 프로젝트 상세 참여자에 대한 VO
 */

public class Pjd_people {
	private String pj_no;
	private String pjd_no;
	private String emp_no;
	private String pic;
	
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
	
	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	@Override
	public String toString() {
		return "Pjd_people [pj_no=" + pj_no + ", pjd_no=" + pjd_no + ", emp_no=" + emp_no + ", pic=" + pic + "]";
	}

	
}
