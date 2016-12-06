package kr.or.epm.Service;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.PayDAO;
import kr.or.epm.VO.Pay;
import kr.or.epm.VO.PayList;

@Service
public class PayService {

	@Autowired
	private SqlSession sqlsession;
	
	//급여 조회하기
	public List<Pay> selectPay_mine_all(String emp_no){
		
		PayDAO payDao = sqlsession.getMapper(PayDAO.class);
		List<Pay> list= payDao.selectPay_mine_all(emp_no);
		System.out.println("service :"+list.size());
		return list;
	}
	//본인 예상 급여 조회
	public Pay selectPay_mine(String emp_no, String dTime){
		System.out.println("예상 급여 :"+emp_no+" / "+dTime);
		PayDAO payDao = sqlsession.getMapper(PayDAO.class);
		Pay list = payDao.selectPay_mine(emp_no, dTime);
		return list;
		
	}
	
	//월별 급여 조회
	public Pay selectPay_mine_Monthly(String emp_no, String give_date){
		PayDAO payDao = sqlsession.getMapper(PayDAO.class);
		Pay pay=payDao.selectPay_mine_Monthly(emp_no, give_date);
		System.out.println("월별 급여 : "+pay.toString());
		
		return pay;
	}
	
	//연도별 급여 조회
	public List<Pay> selectPay_mine_Yearly(String emp_no, String date){
		PayDAO paydao = sqlsession.getMapper(PayDAO.class);
		List<Pay> list = paydao.selectPay_mine_Yearly(emp_no, date);
		return list;
	}
	
	//입사일 조회
	public String selectRegdate(String emp_no){
		System.out.println("입사일 조회 !");
		PayDAO paydao = sqlsession.getMapper(PayDAO.class);
		String regdate = paydao.selectRegdate(emp_no);
		//System.out.println("입사일 : "+regdate);
		return regdate;
		
	}
	//급여 마감 관리
	public List<PayList> selectPay_all_Close(String dTime){
		System.out.println("급여 마감 관리");
		PayDAO dao = sqlsession.getMapper(PayDAO.class);
	    List<PayList> list = dao.selectPay_all_Close(dTime);
	    System.out.println("급여 list size: "+list.size());
	    return list;
	}
	
	//급여 마감 확정
	public int updatePay(String pay_no, String give_date){
		System.out.println("급여 마감 확정");
		int result=0;
		PayDAO dao = sqlsession.getMapper(PayDAO.class);
	    result = dao.updatePay(pay_no, give_date);
		return result;
	}
	
	
	//급여 선택 월 정보 리스트 뿌려주기  - > 카드 에서 상세보기 버튼 클릭시 사용됨
	public List<PayList> select_payMoth_Detail(String date){
		System.out.println("기지급 급여 관리 : "+date);
		PayDAO dao = sqlsession.getMapper(PayDAO.class);
	    List<PayList> list = dao.select_payMoth_Detail(date);
	    System.out.println("급여 list size: "+list.size());
	    return list;
	}
	
	//급여 기본정보 관리 리스트
	public List<PayList> selectPayList_Manage(){
		PayDAO dao = sqlsession.getMapper(PayDAO.class);
		List<PayList> list = dao.selectPayList_Manage();
		System.out.println(" 서비스  sizeeeeeeeeeeeeeeee: "+list.size());
		return list;
		
	}
	
	//급여 기본 정보 수정 페이지
	public PayList selectPayList_Modify(String emp_no){
		PayDAO dao = sqlsession.getMapper(PayDAO.class);
		PayList pay =dao.selectPayList_Modify(emp_no);
		System.out.println(" 서비스 pay : ::::::::::::::"+pay.toString());
		return pay;
	}
	
	//급여 기본 정보 수정 > 연봉 수정
	public int update_pay_Info_emp(PayList paylist){
		PayDAO dao = sqlsession.getMapper(PayDAO.class);
		int result =dao.update_pay_Info_emp(paylist);
		result += dao.update_pay_Info_empdetail(paylist);
		return result;
	}
	
	
	//급여 기본 정보 수정 > 은행, 계좌번호 수정
	

}
