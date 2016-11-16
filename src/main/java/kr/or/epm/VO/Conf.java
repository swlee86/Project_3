package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 백승아
 * 사용 목적 : 회의에 대한 VO
 */

public class Conf {
	private String conf_no;
	private String emp_no;
	private String conf_start;
	private String conf_end;
	private String conf_item;
	private String conf_content;
	private String conf_record;

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

	public String getConf_start() {
		return conf_start;
	}

	public void setConf_start(String conf_start) {
		this.conf_start = conf_start;
	}

	public String getConf_end() {
		return conf_end;
	}

	public void setConf_end(String conf_end) {
		this.conf_end = conf_end;
	}

	public String getConf_item() {
		return conf_item;
	}

	public void setConf_item(String conf_item) {
		this.conf_item = conf_item;
	}

	public String getConf_content() {
		return conf_content;
	}

	public void setConf_content(String conf_content) {
		this.conf_content = conf_content;
	}

	public String getConf_record() {
		return conf_record;
	}

	public void setConf_record(String conf_record) {
		this.conf_record = conf_record;
	}

	@Override
	public String toString() {
		return "Conf [conf_no=" + conf_no + ", emp_no=" + emp_no + ", conf_start=" + conf_start + ", conf_end="
				+ conf_end + ", conf_item=" + conf_item + ", conf_content=" + conf_content + ", conf_record="
				+ conf_record + "]";
	}
}
