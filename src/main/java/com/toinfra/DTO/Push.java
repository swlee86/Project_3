package com.toinfra.DTO;

public class Push {

	private String emp_no;
	private String id;
	
	
	public String getUser_id() {
		return emp_no;
	}
	public void setUser_id(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Push [emp_no=" + emp_no + ", id=" + id + "]";
	}

	

	

}
