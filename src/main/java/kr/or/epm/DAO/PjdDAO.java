package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Pjd;

public interface PjdDAO {
	
	// 큰 프로젝트에 대한 프로젝트 상세 조회하기
	public List<Pjd> selectPjd();
	
	// 프로젝트 상세 등록하기
	public int insertPjd();
	
	// 프로젝트 상세 수정하기 : TODO리스트
	public int updatePjd();
	
	// 진행 단계 처리하기
	public int updatePjd_step();
	
	// 진행률 계산하기
	public int updatePjd_progress();
}
