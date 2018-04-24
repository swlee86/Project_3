package com.toinfra.VO;

import org.springframework.web.multipart.MultipartFile;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	회사정보게시판에 대한 VO
**/
public class Company {
	private String no;
	private String emp_no;
	private String emp_name;
	private int hit;
	private String title;
	private String content;
	private String regdate;
	private MultipartFile uploadfile;
	private String file_name;
	private String del_check;
	private String pic;
	
	
	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
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
	
	public String getFile_name() {
		return file_name;
	}
	
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
	public String getDel_check() {
		return del_check;
	}
	
	public void setDel_check(String del_check) {
		this.del_check = del_check;
	}

	
	
	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	@Override
	public String toString() {
		return "Company [no=" + no + ", emp_no=" + emp_no + ", emp_name=" + emp_name + ", hit=" + hit + ", title="
				+ title + ", content=" + content + ", regdate=" + regdate + ", uploadfile=" + uploadfile
				+ ", file_name=" + file_name + ", del_check=" + del_check + ", pic=" + pic + "]";
	}

	
}
