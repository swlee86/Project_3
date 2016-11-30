package kr.or.epm.DAO;

import java.util.List;
import kr.or.epm.VO.Position;
import kr.or.epm.VO.PositionJoin;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 직위에 대한 DAO interface
*/

public interface PositionDAO {

	// 1.직위 등록하기
	public int insertPosition(PositionJoin position);
	
	//2.직위 기본연봉
	public int insertSet_pay(PositionJoin position);
	
	//3.직위 추가급여
	public int insertSet_add_Pay(PositionJoin position);
	
	// 직위 수정하기
	public int updatePosition(Position position);
	
	//기본 연봉 수정
	public int updateset_pay(PositionJoin position);
	
	//추가 급여 수정
	public int updateset_add_pay(PositionJoin position);
	
	//position_no 구하기 
	public String selectPosition_no(PositionJoin position);
	
	// 직위 조회하기
	public List<PositionJoin> selectPosition(); 
	
	// 직위 상세 조회하기
	public Position selectPosition_detail();
	
	// 직위 삭제하기
	public int deletePosition();
	
	//셀렉트 박스 에서 정보 쭉 뽑아올때 - 조인용 DTO 만들어서 사용함.
	public PositionJoin selectOptionJoin(String positionOption);
	
}
