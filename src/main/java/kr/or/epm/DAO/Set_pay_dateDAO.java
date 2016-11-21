package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Set_pay_date;

public interface Set_pay_dateDAO {

	// 급여 지급일 조회하기
	public List<Set_pay_date> selectSet_pay_date();
	
	// 급여 지급일 등록하기
	public int insertSet_pay_date();
	
	// 급여 지급일 수정하기
	public int updateSet_pay_date();
	
}
