package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.SalesDAO;
import kr.or.epm.VO.Sales;


/*
 * 작성자 : 이상원
 * 작성일 : 2016-11-17
 * 목  적 : 관리자 > 매출 메뉴용 서비스 
 */

@Service
public class SalesService {

	@Autowired
	private SqlSession sqlsession;
	
	//관리자 > 매출 등록에서 매출 등록하는 서비스 메뉴
	public int insertSalesInfo(Sales sales){
		SalesDAO salesdao =  sqlsession.getMapper(SalesDAO.class);
		int result = salesdao.insertSalesInfo(sales);
		return result;
	}
	
	//관리자 > 매출 조회시 매출 리스트 내역을 불러오는 서비스
	public List<Sales> selectSalesInfo(){
		SalesDAO salesdao =  sqlsession.getMapper(SalesDAO.class);
		List<Sales> result = salesdao.selectSalesInfo();
		return result;
	}
	
}
