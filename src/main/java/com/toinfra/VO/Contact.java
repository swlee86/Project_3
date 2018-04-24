package com.toinfra.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 주소록에 대한 VO
 */

public class Contact {
	private String contact_no;
	private String group_no;
	private String name;
	private String attach;
	private String birth;
	private String mail;
	private String pic;
	private String tel1;
	private String tel2;
	private String memo;
	private String empimg;
	
	public String getEmpimg() {
		return empimg;
	}

	public void setEmpimg(String empimg) {
		this.empimg = empimg;
	}

	private String group_name;
		
		
	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getGroup_no() {
		return group_no;
	}

	public void setGroup_no(String group_no) {
		this.group_no = group_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAttach() {
		return attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	@Override
	public String toString() {
		return "Contact [contact_no=" + contact_no + ", group_no=" + group_no + ", name=" + name + ", attach=" + attach
				+ ", birth=" + birth + ", mail=" + mail + ", pic=" + pic + ", tel1=" + tel1 + ", tel2=" + tel2
				+ ", memo=" + memo + ", empimg=" + empimg + ", group_name=" + group_name + "]";
	}
}
