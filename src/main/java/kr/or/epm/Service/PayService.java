package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.PayDAO;
import kr.or.epm.VO.Pay;

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
	//월별 급여 조회
	public Pay selectPay_mine_Monthly(String emp_no, String give_date){
		PayDAO payDao = sqlsession.getMapper(PayDAO.class);
		Pay pay = payDao.selectPay_mine_Monthly(emp_no, give_date);
		System.out.println("월별 급여 : "+pay.toString());
		
		return pay;
	}
	//급여 지급일 조회
	public List<String> selectGive_date(String emp_no){
		PayDAO payDao = sqlsession.getMapper(PayDAO.class);
		List<String> date = payDao.selectGive_date(emp_no);
		System.out.println("급여지급일 : "+date);
		return date;
	}
	
}
