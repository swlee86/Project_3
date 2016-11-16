package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 메모에 대한 VO
 */

public class Memo {
	private String memo_no;
	private String emp_no;
	private String title;
	private String memo_content;
	private String memo_date;
	private String color_no;

	public String getMemo_no() {
		return memo_no;
	}

	public void setMemo_no(String memo_no) {
		this.memo_no = memo_no;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
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

	@Override
	public String toString() {
		return "Memo [memo_no=" + memo_no + ", emp_no=" + emp_no + ", title=" + title + ", memo_content=" + memo_content
				+ ", memo_date=" + memo_date + ", color_no=" + color_no + "]";
	}
}