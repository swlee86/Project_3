package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 급여에 대한 VO
 */

public class Pay {
	private String pay_no;
	private String emp_no;
	private int basic_pay;
	private int severance_pay;
	private int bonus;
	private int add_pay;
	private int total_pay;
	private String give_date;
	
	private int salary;

	public String getPay_no() {
		return pay_no;
	}

	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public int getBasic_pay() {
		return basic_pay;
	}

	public void setBasic_pay(int basic_pay) {
		this.basic_pay = basic_pay;
	}

	public int getSeverance_pay() {
		return severance_pay;
	}

	public void setSeverance_pay(int severance_pay) {
		this.severance_pay = severance_pay;
	}

	public int getBonus() {
		return bonus;
	}

	public void setBonus(int bonus) {
		this.bonus = bonus;
	}

	public int getAdd_pay() {
		return add_pay;
	}

	public void setAdd_pay(int add_pay) {
		this.add_pay = add_pay;
	}

	public int getTotal_pay() {
		return total_pay;
	}

	public void setTotal_pay(int total_pay) {
		this.total_pay = total_pay;
	}

	public String getGive_date() {
		return give_date;
	}

	public void setGive_date(String give_date) {
		this.give_date = give_date;
	}

	@Override
	public String toString() {
		return "Pay [pay_no=" + pay_no + ", emp_no=" + emp_no + ", basic_pay=" + basic_pay + ", severance_pay="
				+ severance_pay + ", bonus=" + bonus + ", add_pay=" + add_pay + ", total_pay=" + total_pay
				+ ", give_date=" + give_date + "]";
	}
}
