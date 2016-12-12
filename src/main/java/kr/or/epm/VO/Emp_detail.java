package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 사원 상세에 대한 VO
 */

public class Emp_detail {
	private String emp_no;
	private String id;
	private String pwd;
	private String bank;
	private String addr;
	private String addr_detail;
	private String account;
	private String postcode;
	private String googleapiid;

	public String getGoogleapiid() {
		return googleapiid;
	}

	public void setGoogleapiid(String googleapiid) {
		this.googleapiid = googleapiid;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
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

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	@Override
	public String toString() {
		return "Emp_detail [emp_no=" + emp_no + ", id=" + id + ", pwd=" + pwd + ", bank=" + bank + ", addr=" + addr
				+ ", addr_detail=" + addr_detail + ", account=" + account + ", postcode=" + postcode + ", googleapiid="
				+ googleapiid + "]";
	}	
}
