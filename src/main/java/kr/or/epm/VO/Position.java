package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 직위에 대한 VO
 */

public class Position {
	private String position_no;
	private String position_name;

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
		return "Position [position_no=" + position_no + ", position_name=" + position_name + "]";
	}
}
