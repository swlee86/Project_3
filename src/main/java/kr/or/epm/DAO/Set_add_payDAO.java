package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Set_add_pay;
import kr.or.epm.VO.Set_pay;

public interface Set_add_payDAO {
	
	// 전체 추가 급여 조회하기
	public List<Set_add_pay> selectSetadd_pay();
	
	// 직위별 추가 급여 조회하기
	public List<Set_pay> selectSet_add_pay_position();
	
	// 추가 급여 수정하기
	public int updateSet_add_pay();
	
	// 추가 급여 등록하기
	public int insertSet_add_pay();
}
