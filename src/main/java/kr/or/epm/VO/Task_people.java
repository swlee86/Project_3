package kr.or.epm.VO;

public class Task_people {
	private String task_no;
	private String emp_no;

	public String getTask_no() {
		return task_no;
	}

	public void setTask_no(String task_no) {
		this.task_no = task_no;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	@Override
	public String toString() {
		return "Task_people [task_no=" + task_no + ", emp_no=" + emp_no + "]";
	}
}
