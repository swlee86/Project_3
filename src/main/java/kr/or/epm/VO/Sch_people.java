package kr.or.epm.VO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	일정참여자에 대한 VO
**/
public class Sch_people {
	private String sch_no;
	private String emp_no;
	
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
	
	@Override
	public String toString() {
		return "Sch_people [sch_no=" + sch_no + ", emp_no=" + emp_no + "]";
	}
}
