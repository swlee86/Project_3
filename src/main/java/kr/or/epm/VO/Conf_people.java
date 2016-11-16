package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 회의 참여자에 대한 VO
 */

public class Conf_people {
	private String conf_no;
	private String emp_no;

	public String getConf_no() {
		return conf_no;
	}

	public void setConf_no(String conf_no) {
		this.conf_no = conf_no;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	@Override
	public String toString() {
		return "Conf_people [conf_no=" + conf_no + ", emp_no=" + emp_no + "]";
	}
}
