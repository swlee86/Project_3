package com.toinfra.DTO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 업무 진행 단계에 대한 DTO
 */

public class Task_step {
	private String task_step_no;
	private String task_step_name;

	public String getTask_step_no() {
		return task_step_no;
	}

	public void setTask_step_no(String task_step_no) {
		this.task_step_no = task_step_no;
	}

	public String getTask_step_name() {
		return task_step_name;
	}

	public void setTask_step_name(String task_step_name) {
		this.task_step_name = task_step_name;
	}

	@Override
	public String toString() {
		return "Task_step [task_step_no=" + task_step_no + ", task_step_name=" + task_step_name + "]";
	}
}
