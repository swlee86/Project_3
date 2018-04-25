package com.toinfra.DTO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 메모에 대한 DTO
 *
 * DTO 추가 2016-11-17 김주희
 */

public class Memo {
	private String memo_no;
	private String emp_no;
	private String title;
	private String memo_content;
	private String memo_date;
	private String color_no;
	
	
	private String color;
	private String color_name;
	
	
	public String getMemo_no() {
		return memo_no;
	}

	public void setMemo_no(String memo_no) {
		this.memo_no = memo_no;
	}

	public String getUser_id() {
		return emp_no;
	}

	public void setUser_id(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMemo_content() {
		return memo_content;
	}

	public void setMemo_content(String memo_content) {
		this.memo_content = memo_content;
	}

	public String getMemo_date() {
		return memo_date;
	}

	public void setMemo_date(String memo_date) {
		this.memo_date = memo_date;
	}

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
		return "Memo [memo_no=" + memo_no + ", emp_no=" + emp_no + ", title=" + title + ", memo_content=" + memo_content
				+ ", memo_date=" + memo_date + ", color_no=" + color_no + ", color=" + color + ", color_name="
				+ color_name + "]";
	}
}
