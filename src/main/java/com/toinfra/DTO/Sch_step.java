package com.toinfra.DTO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	일정 진행단계에 대한 DTO
**/
public class Sch_step {
	private String step_no;
	private String step_name;
	
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
		return "Sch_step [step_no=" + step_no + ", step_name=" + step_name + "]";
	}
}
