package kr.or.epm.VO;

/*
 * 작성일 : 2016-11-28
 * 작성자 : 김주희
 * 사용 목적 : 프로젝트 상세의 상세에 대한 VO
 */

public class Pjdd {
	private String pjdd_no;
	private String pjd_no;
	private String pjdd_content;
	private String fin_check;
	
	public String getPjdd_no() {
		return pjdd_no;
	}
	
	public void setPjdd_no(String pjdd_no) {
		this.pjdd_no = pjdd_no;
	}
	
	public String getPjd_no() {
		return pjd_no;
	}
	
	public void setPjd_no(String pjd_no) {
		this.pjd_no = pjd_no;
	}
	
	public String getPjdd_content() {
		return pjdd_content;
	}
	
	public void setPjdd_content(String pjdd_content) {
		this.pjdd_content = pjdd_content;
	}
	
	public String getFin_check() {
		return fin_check;
	}
	public void setFin_check(String fin_check) {
		this.fin_check = fin_check;
	}
	
	@Override
	public String toString() {
		return "Pjdd [pjdd_no=" + pjdd_no + ", pjd_no=" + pjd_no + ", pjdd_content=" + pjdd_content + ", fin_check="
				+ fin_check + "]";
	}
	
	
}
