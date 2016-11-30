package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 프로젝트 진행 단계에 대한 VO
 */

public class Pj_step {
	private String pj_step_no;
	private String pj_step_name;
	private String step;
	
	public String getPj_step_no() {
		return pj_step_no;
	}

	public void setPj_step_no(String pj_step_no) {
		this.pj_step_no = pj_step_no;
	}

	public String getPj_step_name() {
		return pj_step_name;
	}

	public void setPj_step_name(String pj_step_name) {
		this.pj_step_name = pj_step_name;
	}

	
	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	@Override
	public String toString() {
		return "Pj_step [pj_step_no=" + pj_step_no + ", pj_step_name=" + pj_step_name + ", step=" + step + "]";
	}

	
}
