package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Position;

public interface PositionDAO {

	// 직위 등록하기
	public int insertPosition();
	
	// 직위 수정하기
	public int updatePosition();
	
	// 직위 조회하기
	public List<Position> selectPosition();
	
	// 직위 상세 조회하기
	public Position selectPosition_detail();
	
	// 직위 삭제하기
	public int deletePosition();
}