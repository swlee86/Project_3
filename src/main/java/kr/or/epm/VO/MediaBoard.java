package kr.or.epm.VO;


import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MediaBoard {
	private String no;
	private String emp_no;
	private String emp_name;
	private int hit;
	private String title;
	private String content;
	private String regdate;
	private List<CommonsMultipartFile> file_name; 
	
	public List<CommonsMultipartFile> getFile_name() {
		return file_name;
	}
	public void setFile_name(List<CommonsMultipartFile> file_name) {
		this.file_name = file_name;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
/*	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	*/

}