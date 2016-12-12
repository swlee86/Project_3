package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 메일에 대한 VO
 */

public class Mail {
	private String mail_no;
	private String sign;
	private String title;
	private String mail_content;
	private String file_name;
	private String emp_no;
	private String send_date;
	private String del_check;
	private String rec_name;
	private String rec_mail;
	private String rec_date;
	private String rec_check;
	private String rec_del_check;
	private String send_mail;
	
	public String getSend_mail() {
		return send_mail;
	}

	public void setSend_mail(String send_mail) {
		this.send_mail = send_mail;
	}

	public String getMail_no() {
		return mail_no;
	}

	public void setMail_no(String mail_no) {
		this.mail_no = mail_no;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMail_content() {
		return mail_content;
	}

	public void setMail_content(String mail_content) {
		this.mail_content = mail_content;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	public String getDel_check() {
		return del_check;
	}

	public void setDel_check(String del_check) {
		this.del_check = del_check;
	}

	public String getRec_name() {
		return rec_name;
	}

	public void setRec_name(String rec_name) {
		this.rec_name = rec_name;
	}

	public String getRec_mail() {
		return rec_mail;
	}

	public void setRec_mail(String rec_mail) {
		this.rec_mail = rec_mail;
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

	public String getRec_del_check() {
		return rec_del_check;
	}

	public void setRec_del_check(String rec_del_check) {
		this.rec_del_check = rec_del_check;
	}

	@Override
	public String toString() {
		return "Mail [mail_no=" + mail_no + ", sign=" + sign + ", title=" + title + ", mail_content=" + mail_content
				+ ", file_name=" + file_name + ", emp_no=" + emp_no + ", send_date=" + send_date + ", del_check="
				+ del_check + ", rec_name=" + rec_name + ", rec_mail=" + rec_mail + ", rec_date=" + rec_date
				+ ", rec_check=" + rec_check + ", rec_del_check=" + rec_del_check + "]";
	}
}
