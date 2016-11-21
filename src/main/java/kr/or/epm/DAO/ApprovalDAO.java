package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Approval;

public interface ApprovalDAO {

	// 승인 진행 단계 조회하기
	public List<Approval> selectApproval();
	
	// 승인 진행 단계 등록하기
	public int insertApproval();
	
	// 승인 진행 단계 수정하기
	public int updateApproval();
	
	// 승인 진행 단계 삭제하기
	public int deleteApproval();
	
}
