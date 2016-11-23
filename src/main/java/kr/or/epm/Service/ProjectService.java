package kr.or.epm.Service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.CommuteDAO;
import kr.or.epm.DAO.PjDAO;
import kr.or.epm.VO.Commute;
import kr.or.epm.VO.Pj;


@Service
public class ProjectService {

	@Autowired
	private SqlSession sqlsession;
	
	// 모든 프로젝트 목록 출력
	public List<Pj> selectPjlist_all(){
		
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
			
		List<Pj> list= dao.selectPj();
			
		return list;
	}
	
}
