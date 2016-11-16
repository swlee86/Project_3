package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 기본 출퇴근 설정에 대한 VO
 */

public class Set_time {
	private String set_date;
	private String low_dept_no;
	private String in_time;
	private String out_time;

	public String getSet_date() {
		return set_date;
	}

	public void setSet_date(String set_date) {
		this.set_date = set_date;
	}

	public String getLow_dept_no() {
		return low_dept_no;
	}

	public void setLow_dept_no(String low_dept_no) {
		this.low_dept_no = low_dept_no;
	}

	public String getIn_time() {
		return in_time;
	}

	public void setIn_time(String in_time) {
		this.in_time = in_time;
	}

	public String getOut_time() {
		return out_time;
	}

	public void setOut_time(String out_time) {
		this.out_time = out_time;
	}

	@Override
	public String toString() {
		return "Set_time [set_date=" + set_date + ", low_dept_no=" + low_dept_no + ", in_time=" + in_time
				+ ", out_time=" + out_time + "]";
	}
}
