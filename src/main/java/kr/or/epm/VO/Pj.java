package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 프로젝트에 대한 VO
 */

public class Pj {
	private String pj_no;
	private String emp_no;
	private String pj_title;
	private String pj_content;
	private String pj_start;
	private String pj_end;
	private int pj_progress;
	private String pj_step_no;
	private String step_no;

	public String getPj_no() {
		return pj_no;
	}

	public void setPj_no(String pj_no) {
		this.pj_no = pj_no;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getPj_title() {
		return pj_title;
	}

	public void setPj_title(String pj_title) {
		this.pj_title = pj_title;
	}

	public String getPj_content() {
		return pj_content;
	}

	public void setPj_content(String pj_content) {
		this.pj_content = pj_content;
	}

	public String getPj_start() {
		return pj_start;
	}

	public void setPj_start(String pj_start) {
		this.pj_start = pj_start;
	}

	public String getPj_end() {
		return pj_end;
	}

	public void setPj_end(String pj_end) {
		this.pj_end = pj_end;
	}

	public int getPj_progress() {
		return pj_progress;
	}

	public void setPj_progress(int pj_progress) {
		this.pj_progress = pj_progress;
	}

	public String getPj_step_no() {
		return pj_step_no;
	}

	public void setPj_step_no(String pj_step_no) {
		this.pj_step_no = pj_step_no;
	}

	public String getStep_no() {
		return step_no;
	}

	public void setStep_no(String step_no) {
		this.step_no = step_no;
	}

	@Override
	public String toString() {
		return "Pj [pj_no=" + pj_no + ", emp_no=" + emp_no + ", pj_title=" + pj_title + ", pj_content=" + pj_content
				+ ", pj_start=" + pj_start + ", pj_end=" + pj_end + ", pj_progress=" + pj_progress + ", pj_step_no="
				+ pj_step_no + ", step_no=" + step_no + "]";
	}
}
