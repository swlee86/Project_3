package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 근태에 대한 VO
 */

public class Commute {
	private String commute_no;
	private String cg_no;
	private String emp_no;
	private String regdate;
	private String in_time;
	private String out_time;
	private String commute_time;
	private String add_time;
	private String acc_commute_time;
	private String acc_add_time;
	private String mgr_check;
	private String emp_name;

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getCommute_no() {
		return commute_no;
	}

	public void setCommute_no(String commute_no) {
		this.commute_no = commute_no;
	}

	public String getCg_no() {
		return cg_no;
	}

	public void setCg_no(String cg_no) {
		this.cg_no = cg_no;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

	public String getCommute_time() {
		return commute_time;
	}

	public void setCommute_time(String commute_time) {
		this.commute_time = commute_time;
	}

	public String getAdd_time() {
		return add_time;
	}

	public void setAdd_time(String add_time) {
		this.add_time = add_time;
	}

	public String getAcc_commute_time() {
		return acc_commute_time;
	}

	public void setAcc_commute_time(String acc_commute_time) {
		this.acc_commute_time = acc_commute_time;
	}

	public String getAcc_add_time() {
		return acc_add_time;
	}

	public void setAcc_add_time(String acc_add_time) {
		this.acc_add_time = acc_add_time;
	}

	public String getMgr_check() {
		return mgr_check;
	}

	public void setMgr_check(String mgr_check) {
		this.mgr_check = mgr_check;
	}

	@Override
	public String toString() {
		return "Commute [commute_no=" + commute_no + ", cg_no=" + cg_no + ", emp_no=" + emp_no + ", regdate=" + regdate
				+ ", in_time=" + in_time + ", out_time=" + out_time + ", commute_time=" + commute_time + ", add_time="
				+ add_time + ", acc_commute_time=" + acc_commute_time + ", acc_add_time=" + acc_add_time
				+ ", mgr_check=" + mgr_check + ", emp_name=" + emp_name + "]";
	}
}
