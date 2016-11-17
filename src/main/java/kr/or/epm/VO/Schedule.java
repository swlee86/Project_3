package kr.or.epm.VO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	일정에 대한 VO
**/
public class Schedule {
	private String sch_no;
	private String emp_no;
	private String cg_no;
	private String sign;
	private String sch_name;
	private String sch_start;
	private String sch_end;
	private String sch_content;
	private String step_no;

	
	//추가 DTO 2016-11-18
	private String cg_color;
	private String cg_name; 
	private String step_name;
	private String step;
	
	public String getSch_no() {
		return sch_no;
	}
	
	public void setSch_no(String sch_no) {
		this.sch_no = sch_no;
	}
	
	public String getEmp_no() {
		return emp_no;
	}
	
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	
	public String getCg_no() {
		return cg_no;
	}
	
	public void setCg_no(String cg_no) {
		this.cg_no = cg_no;
	}
	
	public String getSign() {
		return sign;
	}
	
	public void setSign(String sign) {
		this.sign = sign;
	}
	
	public String getSch_name() {
		return sch_name;
	}
	
	public void setSch_name(String sch_name) {
		this.sch_name = sch_name;
	}
	
	public String getSch_start() {
		return sch_start;
	}
	
	public void setSch_start(String sch_start) {
		this.sch_start = sch_start;
	}
	
	public String getSch_end() {
		return sch_end;
	}
	
	public void setSch_end(String sch_end) {
		this.sch_end = sch_end;
	}
	
	public String getSch_content() {
		return sch_content;
	}
	
	public void setSch_content(String sch_content) {
		this.sch_content = sch_content;
	}
	
	public String getStep_no() {
		return step_no;
	}
	
	public void setStep_no(String step_no) {
		this.step_no = step_no;
	}

	public String getCg_color() {
		return cg_color;
	}

	public void setCg_color(String cg_color) {
		this.cg_color = cg_color;
	}

	public String getCg_name() {
		return cg_name;
	}

	public void setCg_name(String cg_name) {
		this.cg_name = cg_name;
	}

	public String getStep_name() {
		return step_name;
	}

	public void setStep_name(String step_name) {
		this.step_name = step_name;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	@Override
	public String toString() {
		return "Schedule [sch_no=" + sch_no + ", emp_no=" + emp_no + ", cg_no=" + cg_no + ", sign=" + sign
				+ ", sch_name=" + sch_name + ", sch_start=" + sch_start + ", sch_end=" + sch_end + ", sch_content="
				+ sch_content + ", step_no=" + step_no + ", cg_color=" + cg_color + ", cg_name=" + cg_name
				+ ", step_name=" + step_name + ", step=" + step + "]";
	}
	
	
	
}
