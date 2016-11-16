package kr.or.epm.VO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	대외발신공문에 대한 VO
**/
public class Office {
	private String draft_no;
	private String rec_place;
	private String rec_fax;
	private String rec_person;
	private String rec_tel;
	private String rec_postcode;
	private String rec_addr;
	private String rec_addr_detail;
	
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

	@Override
	public String toString() {
		return "Office [draft_no=" + draft_no + ", rec_place=" + rec_place + ", rec_fax=" + rec_fax + ", rec_person="
				+ rec_person + ", rec_tel=" + rec_tel + ", rec_postcode=" + rec_postcode + ", rec_addr=" + rec_addr
				+ ", rec_addr_detail=" + rec_addr_detail + "]";
	}
}
