package com.toinfra.DTO;

import org.springframework.web.multipart.MultipartFile;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	자유게시판에 대한 DTO
**/
public class FreeBoard {
	private String no;
	private String emp_no;
	private String emp_name;
	private String low_dept_no;
	private String low_dept_name;
	private int refer;
	private int depth;
	private int step;
	private int hit;
	private String title;
	private String content;
	private String regdate;
	private String file_name;
	private MultipartFile uploadfile;
	
	
	
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
	
	public String getUser_id() {
		return emp_no;
	}
	
	public void setUser_id(String emp_no) {
		this.emp_no = emp_no;
	}
	
	public String getEmp_name() {
		return emp_name;
	}
	
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
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
	
	public int getRefer() {
		return refer;
	}
	
	public void setRefer(int refer) {
		this.refer = refer;
	}
	
	public int getDepth() {
		return depth;
	}
	
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	public int getStep() {
		return step;
	}
	
	public void setStep(int step) {
		this.step = step;
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
	
	@Override
	public String toString() {
		return "Free [no=" + no + ", emp_no=" + emp_no + ", emp_name=" + emp_name + ", low_dept_no=" + low_dept_no
				+ ", low_dept_name=" + low_dept_name + ", refer=" + refer + ", depth=" + depth + ", step=" + step
				+ ", hit=" + hit + ", title=" + title + ", content=" + content + ", regdate=" + regdate + ", file_name="
				+ file_name + "]";
	}
	
}
