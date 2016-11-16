package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 메모 색상에 대한 VO
 */

public class Memocolor {
	private String color_no;
	private String color;
	private String color_name;

	public String getColor_no() {
		return color_no;
	}

	public void setColor_no(String color_no) {
		this.color_no = color_no;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getColor_name() {
		return color_name;
	}

	public void setColor_name(String color_name) {
		this.color_name = color_name;
	}

	@Override
	public String toString() {
		return "Memocolor [color_no=" + color_no + ", color=" + color + ", color_name=" + color_name + "]";
	}
}
