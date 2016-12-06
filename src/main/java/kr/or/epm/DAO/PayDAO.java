package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Pay;
import kr.or.epm.VO.PayList;
import kr.or.epm.VO.Set_pay_date;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 급여에 대한 DAO interface
*/

public interface PayDAO {
	
	// 급여 지급일 이후 급여 등록하기
	public int insertPay(Pay pay);
	
	// 본인의 급여 내역 조회하기
	public List<Pay> selectPay_mine_all(String emp_no);
	
	//본인 예상 급여 내역 조회하기
	public Pay selectPay_mine(String emp_no, String dTime);
	
	//본인 급여 월별 조회하기
	public Pay selectPay_mine_Monthly(String emp_no, String give_date);
	
	//본인 급여 연도별 조회하기
	public List<Pay> selectPay_mine_Yearly(String emp_no, String give_date);
	
	//입사일 조회하기
	public String selectRegdate(String emp_no);
	
    // 본인의 금월 예상 급여 조회하기
	public Pay selectPay_mine();
	
	// 전체 급여 내역 조회하기
	public List<Pay> selectPay_all();
	
	//급여 마감 관리하기 > 첫번째 
	public List<PayList> selectPay_all_Close(String dTime);
	
	//월별 급여 상세 보기 - 카드에서 버튼 클릭시 해당 월 급여 지급 리스트 뜸. -  관리자 > 급여 > 급여내역 조회
	public List<PayList> select_payMoth_Detail(String date);
	
	// 전체 금월 예상 급여 조회하기
	public List<Pay> selectPay();
	
	// 관리자] 급여 확정하기
	public int updatePay(String pay_no);
	
	//급여 지급일 있는지 여부 판단하기 1)
	public String selectpay_date();
	
	//급여지급일 등록하기
	public int insertpay_date(Set_pay_date setpay);
	
	//급여지급일 수정하기
	public int updatepay_date(Set_pay_date setpay);
	
	//급여 기본 정보 관리 리스트
	public List<PayList> selectPayList_Manage();
	
	//급여 기본 정보 수정 페이지
	public PayList selectPayList_Modify(String emp_no);
	
	//급여 기본 정보 수정 > 연봉 update
	public int update_pay_Info_emp(PayList paylist);
	
	//급여 기본 정보 수정  > 은행, 계좌번호 update
	public int update_pay_Info_empdetail(PayList paylist);
	
	
}
