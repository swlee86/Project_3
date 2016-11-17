package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Sales;

/*
 * 작성자 : 이상원
 * 작성일 : 2016-11-17
 * 목  적 : 관리자 > 매출 메뉴용 DAO 
 */

public interface SalesDAO {
	int insertSalesInfo(Sales sales);
	List<Sales> selectSalesInfo();
}
