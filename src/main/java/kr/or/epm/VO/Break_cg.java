package kr.or.epm.VO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	휴가구분에 대한 VO
**/

public class Break_cg {
	private String break_cg_no;
	private String break_cg_name;
	
	public String getBreak_cg_no() {
		return break_cg_no;
	}
	
	public void setBreak_cg_no(String break_cg_no) {
		this.break_cg_no = break_cg_no;
	}
	
	public String getBreak_cg_name() {
		return break_cg_name;
	}
	
	public void setBreak_cg_name(String break_cg_name) {
		this.break_cg_name = break_cg_name;
	}
	
	@Override
	public String toString() {
		return "Break_cg [break_cg_no=" + break_cg_no + ", break_cg_name=" + break_cg_name + "]";
	}
}
