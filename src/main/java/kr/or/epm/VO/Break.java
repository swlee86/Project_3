package kr.or.epm.VO;

/**
작성일 :	2016 - 11 - 16
작성자 :	김주희
사용 목적 :	휴가신청에 대한 VO
**/
public class Break {
	private String draft_no;
	private String break_start;
	private String break_end;
	private String break_term;
	private String break_cg_no;
	
	public String getDraft_no() {
		return draft_no;
	}
	
	public void setDraft_no(String draft_no) {
		this.draft_no = draft_no;
	}
	
	public String getBreak_start() {
		return break_start;
	}
	
	public void setBreak_start(String break_start) {
		this.break_start = break_start;
	}
	
	public String getBreak_end() {
		return break_end;
	}
	
	public void setBreak_end(String break_end) {
		this.break_end = break_end;
	}
	
	public String getBreak_term() {
		return break_term;
	}
	
	public void setBreak_term(String break_term) {
		this.break_term = break_term;
	}
	
	public String getBreak_cg_no() {
		return break_cg_no;
	}
	
	public void setBreak_cg_no(String break_cg_no) {
		this.break_cg_no = break_cg_no;
	}

	@Override
	public String toString() {
		return "Break [draft_no=" + draft_no + ", break_start=" + break_start + ", break_end=" + break_end
				+ ", break_term=" + break_term + ", break_cg_no=" + break_cg_no + "]";
	}
}
