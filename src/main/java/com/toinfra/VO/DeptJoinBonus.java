package com.toinfra.VO;
/*
 * 작성일 : 2011-11-30
 * 작성자 : 하재현
 * 목 적 : 관리자 > 부서관리 관련 dept join set_bonus
 * */
public class DeptJoinBonus {
	
	private String dept_no;
	private String branch_no;
	private String branch_name;
	private String dept_name;
	private String pre_dept_no;
	private String his_check;
	private String set_date;
	private int bonus_percent;
	private String bonus_check;
	
	
	
	public String getBonus_check() {
		return bonus_check;
	}
	public void setBonus_check(String bonus_check) {
		this.bonus_check = bonus_check;
	}
	public String getDept_no() {
		return dept_no;
	}
	public void setDept_no(String dept_no) {
		this.dept_no = dept_no;
	}
	public String getBranch_no() {
		return branch_no;
	}
	public void setBranch_no(String branch_no) {
		this.branch_no = branch_no;
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
	public String getPre_dept_no() {
		return pre_dept_no;
	}
	public void setPre_dept_no(String pre_dept_no) {
		this.pre_dept_no = pre_dept_no;
	}
	public String getHis_check() {
		return his_check;
	}
	public void setHis_check(String his_check) {
		this.his_check = his_check;
	}
	public String getSet_date() {
		return set_date;
	}
	public void setSet_date(String set_date) {
		this.set_date = set_date;
	}
	public int getBonus_percent() {
		return bonus_percent;
	}
	public void setBonus_percent(int bonus_percent) {
		this.bonus_percent = bonus_percent;
	}
	@Override
	public String toString() {
		return "DeptJoinBonus [dept_no=" + dept_no + ", branch_no=" + branch_no + ", branch_name=" + branch_name
				+ ", dept_name=" + dept_name + ", pre_dept_no=" + pre_dept_no + ", his_check=" + his_check
				+ ", set_date=" + set_date + ", bonus_percent=" + bonus_percent + ", bonus_check=" + bonus_check + "]";
	}
	
	
}
