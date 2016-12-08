package kr.or.epm.VO;

import org.springframework.web.multipart.MultipartFile;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 업무에 대한 VO
 */

public class Task {
	private String task_no;
	private String cg_no;
	private String sign;
	private String task_name;
	private String deadline;
	private String content;
	private String rec_emp_no;
	private String rec_name;
	private String rec_date;
	private String emp_no;
	private String emp_name;
	private String send_date;
	private String file_name;
	private String task_step_no;
	private String step_no;
	private MultipartFile uploadfile;
	
	
	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}

	// 추가 변수
	private String cg_name;
	private String step_name;
	
	public String getCg_name() {
		return cg_name;
	}

	public void setCg_name(String cg_name) {
		this.cg_name = cg_name;
	}
	
	public String getStep_name() {
		return step_name;
	}

	public void setStep_name(String step_name) {
		this.step_name = step_name;
	}
	
	//////////////////////////////////////////////////////

	public String getTask_no() {
		return task_no;
	}

	public void setTask_no(String task_no) {
		this.task_no = task_no;
	}

	public String getCg_no() {
		return cg_no;
	}

	public void setCg_no(String cg_no) {
		this.cg_no = cg_no;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getTask_name() {
		return task_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRec_emp_no() {
		return rec_emp_no;
	}

	public void setRec_emp_no(String rec_emp_no) {
		this.rec_emp_no = rec_emp_no;
	}

	public String getRec_name() {
		return rec_name;
	}

	public void setRec_name(String rec_name) {
		this.rec_name = rec_name;
	}

	public String getRec_date() {
		return rec_date;
	}

	public void setRec_date(String rec_date) {
		this.rec_date = rec_date;
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

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getTask_step_no() {
		return task_step_no;
	}

	public void setTask_step_no(String task_step_no) {
		this.task_step_no = task_step_no;
	}

	public String getStep_no() {
		return step_no;
	}

	public void setStep_no(String step_no) {
		this.step_no = step_no;
	}

	@Override
	public String toString() {
		return "Task [task_no=" + task_no + ", cg_no=" + cg_no + ", sign=" + sign + ", task_name=" + task_name
				+ ", deadline=" + deadline + ", content=" + content + ", rec_emp_no=" + rec_emp_no + ", rec_name="
				+ rec_name + ", rec_date=" + rec_date + ", emp_no=" + emp_no + ", emp_name=" + emp_name + ", send_date="
				+ send_date + ", file_name=" + file_name + ", task_step_no=" + task_step_no + ", step_no=" + step_no
				+ ", uploadfile=" + uploadfile + ", cg_name=" + cg_name + ", step_name=" + step_name + "]";
	}

	
}
