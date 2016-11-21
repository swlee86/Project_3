package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Client;

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
