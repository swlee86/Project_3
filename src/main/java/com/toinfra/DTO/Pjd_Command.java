package com.toinfra.DTO;

import java.util.List;
/*
 * 작성일 : 2016-11-28
 * 작성자 : 박지은
 * 사용 목적 : 프로젝트 상세에 대한 DTO
 */

public class Pjd_Command {
	private List<Pjd> pjd;

	public List<Pjd> getPjd() {
		return pjd;
	}

	public void setPjd(List<Pjd> pjd) {
		this.pjd = pjd;
	}

	@Override
	public String toString() {
		return "PjdCommand [pjd=" + pjd + "]";
	}
	
	

}
