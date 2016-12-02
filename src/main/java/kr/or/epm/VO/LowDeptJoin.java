package kr.or.epm.VO;
/*
 * 작성일 : 2016-12-01
 * 작성자 : 하재현
 * 목적 : 하위부서 조회/수정/등록 관련 VO
 * */
public class LowDeptJoin {

	private String low_dept_no;
	private String dept_no;
	private String branch_name;
	private String dept_name;
	private String low_dept_name;
	private String tel;
	private String fax;
	private String pre_low_dept_no;
	private String his_check;
	private int depth;
	private String set_date;
	private String open;
	private String close;
	private String in_time;
	private String out_time;
	public String getLow_dept_no() {
		return low_dept_no;
	}
	public void setLow_dept_no(String low_dept_no) {
		this.low_dept_no = low_dept_no;
	}
	public String getDept_no() {
		return dept_no;
	}
	public void setDept_no(String dept_no) {
		this.dept_no = dept_no;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getLow_dept_name() {
		return low_dept_name;
	}
	public void setLow_dept_name(String low_dept_name) {
		this.low_dept_name = low_dept_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getPre_low_dept_no() {
		return pre_low_dept_no;
	}
	public void setPre_low_dept_no(String pre_low_dept_no) {
		this.pre_low_dept_no = pre_low_dept_no;
	}
	public String getHis_check() {
		return his_check;
	}
	public void setHis_check(String his_check) {
		this.his_check = his_check;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getSet_date() {
		return set_date;
	}
	public void setSet_date(String set_date) {
		this.set_date = set_date;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getClose() {
		return close;
	}
	public void setClose(String close) {
		this.close = close;
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
		return "LowDeptJoin [low_dept_no=" + low_dept_no + ", dept_no=" + dept_no + ", branch_name=" + branch_name
				+ ", dept_name=" + dept_name + ", low_dept_name=" + low_dept_name + ", tel=" + tel + ", fax=" + fax
				+ ", pre_low_dept_no=" + pre_low_dept_no + ", his_check=" + his_check + ", depth=" + depth
				+ ", set_date=" + set_date + ", open=" + open + ", close=" + close + ", in_time=" + in_time
				+ ", out_time=" + out_time + "]";
	}
	
	
	
	
	
}
