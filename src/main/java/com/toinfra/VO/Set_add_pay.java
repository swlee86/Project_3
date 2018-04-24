package com.toinfra.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 추가 급여 설정에 대한 VO
 */

public class Set_add_pay {
	private String set_date;
	private String position_no;
	private int add_pay;

	public String getSet_date() {
		return set_date;
	}

	public void setSet_date(String set_date) {
		this.set_date = set_date;
	}

	public String getPosition_no() {
		return position_no;
	}

	public void setPosition_no(String position_no) {
		this.position_no = position_no;
	}

	public int getAdd_pay() {
		return add_pay;
	}

	public void setAdd_pay(int add_pay) {
		this.add_pay = add_pay;
	}

	@Override
	public String toString() {
		return "Set_add_pay [set_date=" + set_date + ", position_no=" + position_no + ", add_pay=" + add_pay + "]";
	}
}
