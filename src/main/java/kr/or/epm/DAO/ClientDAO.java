package kr.or.epm.DAO;

import java.util.List;
import kr.or.epm.VO.Client;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 거래처에 대한 DAO interface
*/

public interface ClientDAO {

	// 거래처 조회하기
	public List<Client> selectClient();
	
	// 거래처 등록하기
	public int insertClient();
	
	// 거래처 수정하기
	public int updateClient();
	
	// 거래처 상세보기
	public Client selectClient_detail();
	
	// 거래처 삭제하기
	public int deleteClient();
}
