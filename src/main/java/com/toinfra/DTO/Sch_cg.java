package com.toinfra.DTO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	일정 범주에 대한 DTO
**/
public class Sch_cg {
	private String cg_no;
	private String cg_color;
	private String cg_name;
	
	public String getCg_no() {
		return cg_no;
	}
	
	public void setCg_no(String cg_no) {
		this.cg_no = cg_no;
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
	
	@Override
	public String toString() {
		return "Sch_cg [cg_no=" + cg_no + ", cg_color=" + cg_color + ", cg_name=" + cg_name + "]";
	}
}
