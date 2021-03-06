package com.toinfra.DTO;
/*
 * 작성일 : 2016-11-26
 * 작성자 : 하재현
 * 사용 목적 : 급여 마감 관리 vo
 */
public class PayList {
	private String pay_no;
	private String emp_no;
	private String commute_no;
	private int total_pay;
	private String give_date;
	private String branch_name;
	private String dept_name;
	private String low_dept_name;
	private String emp_name;
	private String position_name;
	private String acc_commute_time;
	private String acc_add_time;
	private String master_check;
	private String mgr_check;
	private String pay_date;
	private int salary;
	private String account;
	private String bank;
	private String regdate;
	
	
	
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getMgr_check() {
		return mgr_check;
	}
	public void setMgr_check(String mgr_check) {
		this.mgr_check = mgr_check;
	}
	public String getMaster_check() {
		return master_check;
	}
	public void setMaster_check(String master_check) {
		this.master_check = master_check;
	}
	public String getPay_no() {
		return pay_no;
	}
	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}
	public String getUser_id() {
		return emp_no;
	}
	public void setUser_id(String emp_no) {
		this.emp_no = emp_no;
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
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getLow_dept_name() {
		return low_dept_name;
	}
	public void setLow_dept_name(String low_dept_name) {
		this.low_dept_name = low_dept_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	public String getAcc_commute_time() {
		return acc_commute_time;
	}
	public void setAcc_commute_time(String acc_commute_time) {
		this.acc_commute_time = acc_commute_time;
	}
	public String getAcc_add_time() {
		return acc_add_time;
	}
	public void setAcc_add_time(String acc_add_time) {
		this.acc_add_time = acc_add_time;
	}
	public String getCommute_no() {
		return commute_no;
	}
	public void setCommute_no(String commute_no) {
		this.commute_no = commute_no;
	}
	
	@Override
	public String toString() {
		return "PayList [pay_no=" + pay_no + ", emp_no=" + emp_no + ", commute_no=" + commute_no + ", total_pay="
				+ total_pay + ", give_date=" + give_date + ", branch_name=" + branch_name + ", dept_name=" + dept_name
				+ ", low_dept_name=" + low_dept_name + ", emp_name=" + emp_name + ", position_name=" + position_name
				+ ", acc_commute_time=" + acc_commute_time + ", acc_add_time=" + acc_add_time + ", master_check="
				+ master_check + ", mgr_check=" + mgr_check + ", pay_date=" + pay_date + ", salary=" + salary
				+ ", account=" + account + ", bank=" + bank + ", regdate=" + regdate + "]";
	}
	
	

}
