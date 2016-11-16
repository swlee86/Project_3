package kr.or.epm.VO;

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
