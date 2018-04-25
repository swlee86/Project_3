package com.toinfra.DTO;

import java.util.List;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 직위에 대한 DTO
 */

public class Position {
	private String position_no;
	private String position_name;
	
	// 관리자 > 권한 부여(부여되어 있는 권한 목록)
	private List<String> rolelist;
	
	public List<String> getRolelist() {
		return rolelist;
	}

	public void setRolelist(List<String> rolelist) {
		this.rolelist = rolelist;
	}

	public String getPosition_no() {
		return position_no;
	}

	public void setPosition_no(String position_no) {
		this.position_no = position_no;
	}

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	@Override
	public String toString() {
		return "Position [position_no=" + position_no + ", position_name=" + position_name + ", rolelist=" + rolelist
				+ "]";
	}
}
