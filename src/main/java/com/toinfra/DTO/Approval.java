package com.toinfra.DTO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 승인 진행 단계에 대한 DTO
 */

public class Approval {
	private String step_no;
	private String step_name;
	private String step;

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public String getStep_no() {
		return step_no;
	}

	public void setStep_no(String step_no) {
		this.step_no = step_no;
	}

	public String getStep_name() {
		return step_name;
	}

	public void setStep_name(String step_name) {
		this.step_name = step_name;
	}

	@Override
	public String toString() {
		return "Approval [step_no=" + step_no + ", step_name=" + step_name + ", step=" + step + "]";
	}
}
