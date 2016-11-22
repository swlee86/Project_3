package kr.or.epm.VO;

public class Emp_role {

	private String role_no;
	private String emp_no;
	private String role_name;

	public String getRole_no() {
		return role_no;
	}

	public void setRole_no(String role_no) {
		this.role_no = role_no;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	@Override
	public String toString() {
		return "Emp_role [role_no=" + role_no + ", emp_no=" + emp_no + ", role_name=" + role_name + "]";
	}
}
