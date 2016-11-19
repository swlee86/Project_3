package kr.or.epm.VO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	업무정보공유게시판 덧글에 대한 VO
**/
public class Re_BusinessBoard {
	private String re_no;
	private String no;
	private String emp_no;
	private String emp_name;
	private String content;
	private String regdate;
	private String low_dept_no;
	private String low_dept_name;
	
	
	public String getLow_dept_no() {
		return low_dept_no;
	}

	public void setLow_dept_no(String low_dept_no) {
		this.low_dept_no = low_dept_no;
	}

	public String getLow_dept_name() {
		return low_dept_name;
	}

	public void setLow_dept_name(String low_dept_name) {
		this.low_dept_name = low_dept_name;
	}

	public String getRe_no() {
		return re_no;
	}
	
	public void setRe_no(String re_no) {
		this.re_no = re_no;
	}
	
	public String getNo() {
		return no;
	}
	
	public void setNo(String no) {
		this.no = no;
	}
	
	public String getEmp_no() {
		return emp_no;
	}
	
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	
	public String getEmp_name() {
		return emp_name;
	}
	
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getRegdate() {
		return regdate;
	}
	
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Re_BusinessBoard [re_no=" + re_no + ", no=" + no + ", emp_no=" + emp_no + ", emp_name=" + emp_name
				+ ", content=" + content + ", regdate=" + regdate + ", low_dept_no=" + low_dept_no + ", low_dept_name="
				+ low_dept_name + "]";
	}
	

	
	

}
