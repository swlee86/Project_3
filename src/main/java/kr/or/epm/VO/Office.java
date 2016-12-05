package kr.or.epm.VO;

import org.springframework.web.multipart.MultipartFile;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	대외발신공문에 대한 VO
**/

public class Office {
	
	// 대외발신공문에 대한 데이터
	private String draft_no;
	private String rec_place;
	private String rec_fax;
	private String rec_person;
	private String rec_tel;
	private String rec_postcode;
	private String rec_addr;
	private String rec_addr_detail;
	
	//추가 DTO 2016-11-18
	// 기본 전자결재에 대한 데이터
	private String cg_no;
	private String draft_title;
	private	String draft_content;
	private String emp_no;
	private String draft_date;
	private String file_name;
	private String step_no;
	private String rec_del_check;
	private String del_check;
	
	// 추가 VO 2016-11-30
	// 파일 업로드에 대한 데이터
	private MultipartFile uploadfile;
	private String emp_name;
	private String rec_check;
	private String low_dept_name;
	private String dept_name;
	private String branch_name;
	
	
	public String getLow_dept_name() {
		return low_dept_name;
	}

	public void setLow_dept_name(String low_dept_name) {
		this.low_dept_name = low_dept_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}

	public String getRec_check() {
		return rec_check;
	}

	public void setRec_check(String rec_check) {
		this.rec_check = rec_check;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}

	public String getDraft_no() {
		return draft_no;
	}
	
	public void setDraft_no(String draft_no) {
		this.draft_no = draft_no;
	}
	
	public String getRec_place() {
		return rec_place;
	}
	
	public void setRec_place(String rec_place) {
		this.rec_place = rec_place;
	}
	
	public String getRec_fax() {
		return rec_fax;
	}
	
	public void setRec_fax(String rec_fax) {
		this.rec_fax = rec_fax;
	}
	
	public String getRec_person() {
		return rec_person;
	}
	
	public void setRec_person(String rec_person) {
		this.rec_person = rec_person;
	}
	
	public String getRec_tel() {
		return rec_tel;
	}
	
	public void setRec_tel(String rec_tel) {
		this.rec_tel = rec_tel;
	}
	
	public String getRec_postcode() {
		return rec_postcode;
	}
	
	public void setRec_postcode(String rec_postcode) {
		this.rec_postcode = rec_postcode;
	}
	
	public String getRec_addr() {
		return rec_addr;
	}
	
	public void setRec_addr(String rec_addr) {
		this.rec_addr = rec_addr;
	}
	
	public String getRec_addr_detail() {
		return rec_addr_detail;
	}
	
	public void setRec_addr_detail(String rec_addr_detail) {
		this.rec_addr_detail = rec_addr_detail;
	}

	public String getCg_no() {
		return cg_no;
	}

	public void setCg_no(String cg_no) {
		this.cg_no = cg_no;
	}

	public String getDraft_title() {
		return draft_title;
	}

	public void setDraft_title(String draft_title) {
		this.draft_title = draft_title;
	}

	public String getDraft_content() {
		return draft_content;
	}

	public void setDraft_content(String draft_content) {
		this.draft_content = draft_content;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getDraft_date() {
		return draft_date;
	}

	public void setDraft_date(String draft_date) {
		this.draft_date = draft_date;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getStep_no() {
		return step_no;
	}

	public void setStep_no(String step_no) {
		this.step_no = step_no;
	}

	public String getRec_del_check() {
		return rec_del_check;
	}

	public void setRec_del_check(String rec_del_check) {
		this.rec_del_check = rec_del_check;
	}

	public String getDel_check() {
		return del_check;
	}

	public void setDel_check(String del_check) {
		this.del_check = del_check;
	}

	@Override
	public String toString() {
		return "Office [draft_no=" + draft_no + ", rec_place=" + rec_place + ", rec_fax=" + rec_fax + ", rec_person="
				+ rec_person + ", rec_tel=" + rec_tel + ", rec_postcode=" + rec_postcode + ", rec_addr=" + rec_addr
				+ ", rec_addr_detail=" + rec_addr_detail + ", cg_no=" + cg_no + ", draft_title=" + draft_title
				+ ", draft_content=" + draft_content + ", emp_no=" + emp_no + ", draft_date=" + draft_date
				+ ", file_name=" + file_name + ", step_no=" + step_no + ", rec_del_check=" + rec_del_check
				+ ", del_check=" + del_check + ", uploadfile=" + uploadfile + ", emp_name=" + emp_name + ", rec_check="
				+ rec_check + ", low_dept_name=" + low_dept_name + ", dept_name=" + dept_name + ", branch_name="
				+ branch_name + "]";
	}
}
