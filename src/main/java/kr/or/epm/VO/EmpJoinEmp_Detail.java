package kr.or.epm.VO;

public class EmpJoinEmp_Detail {

	private String emp_no;
	private String emp_name;
	private String dept_name;
	private String birth;
	private String pic;
	private String email;
	private String low_dept_no;
	private String cell_phone;
	private String emp_tel;
	private String id;
	private String pwd;
	private String bank;
	private String addr;
	private String addr_detail;
	private String account;
	private String postcode;
	
	
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getLow_dept_no() {
		return low_dept_no;
	}
	public void setLow_dept_no(String low_dept_no) {
		this.low_dept_no = low_dept_no;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCell_phone() {
		return cell_phone;
	}
	public void setCell_phone(String cell_phone) {
		this.cell_phone = cell_phone;
	}
	public String getEmp_tel() {
		return emp_tel;
	}
	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
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
		return "EmpJoinEmp_Detail [emp_no=" + emp_no + ", emp_name=" + emp_name + ", birth=" + birth + ", pic=" + pic
				+ ", email=" + email + ", cell_phone=" + cell_phone + ", emp_tel=" + emp_tel + ", id=" + id + ", pwd="
				+ pwd + ", bank=" + bank + ", addr=" + addr + ", addr_detail=" + addr_detail + ", account=" + account
				+ ", postcode=" + postcode + "]";
	}
	
	
	
}
