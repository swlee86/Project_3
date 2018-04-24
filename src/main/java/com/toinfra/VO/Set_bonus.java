package com.toinfra.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 상여금 설정에 대한 VO
 */

public class Set_bonus {
	private String set_date;
	private String dept_no;
	private int bonus_percent;
	private String bonus_check;

	public String getSet_date() {
		return set_date;
	}

	public void setSet_date(String set_date) {
		this.set_date = set_date;
	}

	public String getDept_no() {
		return dept_no;
	}

	public void setDept_no(String dept_no) {
		this.dept_no = dept_no;
	}

	public int getBonus_percent() {
		return bonus_percent;
	}

	public void setBonus_percent(int bonus_percent) {
		this.bonus_percent = bonus_percent;
	}

	public String getBonus_check() {
		return bonus_check;
	}

	public void setBonus_check(String bonus_check) {
		this.bonus_check = bonus_check;
	}

	@Override
	public String toString() {
		return "Set_bonus [set_date=" + set_date + ", dept_no=" + dept_no + ", bonus_percent=" + bonus_percent
				+ ", bonus_check=" + bonus_check + "]";
	}
}
