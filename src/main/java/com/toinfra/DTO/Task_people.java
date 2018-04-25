package com.toinfra.DTO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 업무 참여자에 대한 DTO
 */

public class Task_people {
	private String task_no;
	private String emp_no;
	private String emp_name;
	private String[] peopleList;
	
	public String[] getPeopleList() {
		return peopleList;
	}

	public void setPeopleList(String[] peopleList) {
		this.peopleList = peopleList;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getTask_no() {
		return task_no;
	}

	public void setTask_no(String task_no) {
		this.task_no = task_no;
	}

	public String getUser_id() {
		return emp_no;
	}

	public void setUser_id(String emp_no) {
		this.emp_no = emp_no;
	}

	@Override
	public String toString() {
		return "Task_people [task_no=" + task_no + ", emp_no=" + emp_no + ", emp_name=" + emp_name + "]";
	}
}
