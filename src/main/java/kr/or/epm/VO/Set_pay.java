package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 기본 급여 설정에 대한 VO
 */

public class Set_pay {
	private String set_date;
	private String position_no;
	private int basic_pay;

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

	public int getBasic_pay() {
		return basic_pay;
	}

	public void setBasic_pay(int basic_pay) {
		this.basic_pay = basic_pay;
	}

	@Override
	public String toString() {
		return "Set_pay [set_date=" + set_date + ", position_no=" + position_no + ", basic_pay=" + basic_pay + "]";
	}
}
