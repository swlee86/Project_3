package com.toinfra.DTO;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 급여 지급일에 대한 DTO
 */

public class Set_pay_date {
	private String set_date;
	private String pay_date;

	public String getSet_date() {
		return set_date;
	}

	public void setSet_date(String set_date) {
		this.set_date = set_date;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	@Override
	public String toString() {
		return "Set_pay_date [set_date=" + set_date + ", pay_date=" + pay_date + "]";
	}
}
