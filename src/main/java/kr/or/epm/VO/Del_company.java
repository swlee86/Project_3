package kr.or.epm.VO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	회사정보게시판의 게시판 삭제 대기 VO
**/
public class Del_company {
	private String no;
	private String del_date;
	
	public String getNo() {
		return no;
	}
	
	public void setNo(String no) {
		this.no = no;
	}
	
	public String getDel_date() {
		return del_date;
	}
	
	public void setDel_date(String del_date) {
		this.del_date = del_date;
	}
	
	@Override
	public String toString() {
		return "Del_company [no=" + no + ", del_date=" + del_date + "]";
	}
	
	

}
