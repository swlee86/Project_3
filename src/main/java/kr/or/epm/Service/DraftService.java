package kr.or.epm.Service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DraftService {

	@Autowired
	private SqlSession sqlsession;
	
}
