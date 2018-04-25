package com.toinfra.DTO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 사원 이력 구분에 대한 DTO
 */

public class Emp_his_cg {
	private String cg_no;
	private String cg_name;

	public String getCredential_id() {
		return cg_no;
	}

	public void setCg_no(String cg_no) {
		this.cg_no = cg_no;
	}

	public String getCg_name() {
		return cg_name;
	}

	public void setCg_name(String cg_name) {
		this.cg_name = cg_name;
	}

	@Override
	public String toString() {
		return "Emp_his_cg [cg_no=" + cg_no + ", cg_name=" + cg_name + "]";
	}
}
