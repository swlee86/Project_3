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
	public int updatePay(String pay_no){
		System.out.println("급여 마감 확정");
		int result=0;
		PayDAO dao = sqlsession.getMapper(PayDAO.class);
	    result = dao.updatePay(pay_no);
		return result;
		
	}
	
	

}
