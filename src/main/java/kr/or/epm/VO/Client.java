package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 거래처에 대한 VO
 */

public class Client {
	private String client_no;
	private String name;
	private String addr;
	private String addr_detail;
	private String postcode;
	private String fax;
	private String tel;
	private String memo;
	private String emp_no;

	public String getClient_no() {
		return client_no;
	}

	public void setClient_no(String client_no) {
		this.client_no = client_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	@Override
	public String toString() {
		return "Client [client_no=" + client_no + ", name=" + name + ", addr=" + addr + ", addr_detail=" + addr_detail
				+ ", postcode=" + postcode + ", fax=" + fax + ", tel=" + tel + ", memo=" + memo + ", emp_no=" + emp_no
				+ "]";
	}
}
