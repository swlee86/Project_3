package com.toinfra.VO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	협조문에 대한 VO
**/
public class Cooperation {
	private String draft_no;
	private String low_dept_no;
	
	// 추가 DTO 2016-11-18
	private String dept_no;
	private String branch_name;
	private String dept_name;
	private String low_dept_name;
	private String tel;
	private String fax;
	private String pre_low_dept_no;
	private String his_check;
	private int depth;
	private String cg_no;
	private String draft_title;
	private String draft_content;
	private String emp_no; 
	private String  draft_date;
	private String file_name;
	private String step_no;
	private String rec_del_check;
	private String del_check;
     
    // 추가
	private String emp_name;
	private String rec_check;
	private String rec_date;
	private String app_check;
	
	public String getApp_check() {
		return app_check;
	}

	public void setApp_check(String app_check) {
		this.app_check = app_check;
	}

	public String getRec_date() {
		return rec_date;
	}

	public void setRec_date(String rec_date) {
		this.rec_date = rec_date;
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

	public String getDraft_no() {
		return draft_no;
	}
	
	public void setDraft_no(String draft_no) {
		this.draft_no = draft_no;
	}
	
	public String getLow_dept_no() {
		return low_dept_no;
	}
	
	public void setLow_dept_no(String low_dept_no) {
		this.low_dept_no = low_dept_no;
	}

	public String getDept_no() {
		return dept_no;
	}

	public void setDept_no(String dept_no) {
		this.dept_no = dept_no;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getLow_dept_name() {
		return low_dept_name;
	}

	public void setLow_dept_name(String low_dept_name) {
		this.low_dept_name = low_dept_name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getPre_low_dept_no() {
		return pre_low_dept_no;
	}

	public void setPre_low_dept_no(String pre_low_dept_no) {
		this.pre_low_dept_no = pre_low_dept_no;
	}

	public String getHis_check() {
		return his_check;
	}

	public void setHis_check(String his_check) {
		this.his_check = his_check;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
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
		return draft_content.replace("\r\n","<br>");
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
		return "Cooperation [draft_no=" + draft_no + ", low_dept_no=" + low_dept_no + ", dept_no=" + dept_no
				+ ", branch_name=" + branch_name + ", dept_name=" + dept_name + ", low_dept_name=" + low_dept_name
				+ ", tel=" + tel + ", fax=" + fax + ", pre_low_dept_no=" + pre_low_dept_no + ", his_check=" + his_check
				+ ", depth=" + depth + ", cg_no=" + cg_no + ", draft_title=" + draft_title + ", draft_content="
				+ draft_content + ", emp_no=" + emp_no + ", draft_date=" + draft_date + ", file_name=" + file_name
				+ ", step_no=" + step_no + ", rec_del_check=" + rec_del_check + ", del_check=" + del_check + "]";
	}

	
}
