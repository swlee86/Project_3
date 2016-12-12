package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 지점 단계에 대한 VO
 */

public class Branch {
	private String branch_no;
	private String branch_name;
	private String postcode;
	private String addr;
	private String addr_detail;
	private String pre_branch_no;
	private String his_check;
	private int depth;

	public String getBranch_no() {
		return branch_no;
	}

	public void setBranch_no(String branch_no) {
		this.branch_no = branch_no;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr_detail() {
		return addr_detail;
	}

	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}

	public String getPre_branch_no() {
		return pre_branch_no;
	}

	public void setPre_branch_no(String pre_branch_no) {
		this.pre_branch_no = pre_branch_no;
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

	@Override
	public String toString() {
		return "Branch [branch_no=" + branch_no + ", branch_name=" + branch_name + ", postcode=" + postcode + ", addr="
				+ addr + ", addr_detail=" + addr_detail + ", pre_branch_no=" + pre_branch_no + ", his_check="
				+ his_check + ", depth=" + depth + "]";
	}
}
