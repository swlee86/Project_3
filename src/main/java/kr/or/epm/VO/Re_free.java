package kr.or.epm.VO;
/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	자유게시판 덧글에 대한 VO
**/

public class Re_free {
	private String re_no;
	private String no;
	private String emp_no;
	private String emp_name;
	private String content;
	private String regdate;
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
		return "Re_free [re_no=" + re_no + ", no=" + no + ", emp_no=" + emp_no + ", emp_name=" + emp_name + ", content="
				+ content + ", regdate=" + regdate + "]";
	}
	
	
}
