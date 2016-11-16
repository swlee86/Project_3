package kr.or.epm.VO;

public class Pj_step {
	private String pj_step_no;
	private String pj_step_name;

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

	@Override
	public String toString() {
		return "Pj_step [pj_step_no=" + pj_step_no + ", pj_step_name=" + pj_step_name + "]";
	}
}
