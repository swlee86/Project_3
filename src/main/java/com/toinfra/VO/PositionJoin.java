package com.toinfra.VO;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-29
 * 목  적 : 직위 select 선택시 데이터 뽑기 위한 조인 dto
 */

public class PositionJoin {

	private String position_no;
	private String position_name;
	private int step;
	private String set_date;
	private int basic_pay;
	private int add_pay;
	
	public String getPosition_no() {
		return position_no;
	}
	public void setPosition_no(String position_no) {
		this.position_no = position_no;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getSet_date() {
		return set_date;
	}
	public void setSet_date(String set_date) {
		this.set_date = set_date;
	}
	public int getBasic_pay() {
		return basic_pay;
	}
	public void setBasic_pay(int basic_pay) {
		this.basic_pay = basic_pay;
	}
	public int getAdd_pay() {
		return add_pay;
	}
	public void setAdd_pay(int add_pay) {
		this.add_pay = add_pay;
	}
	
	@Override
	public String toString() {
		return "PositionJoin [position_no=" + position_no + ", position_name=" + position_name + ", step=" + step
				+ ", set_date=" + set_date + ", basic_pay=" + basic_pay + ", add_pay=" + add_pay + "]";
	}
	
	
	
}
