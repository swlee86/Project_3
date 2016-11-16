package kr.or.emp.Service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.VO.Emp;


@Service
public class RegisterService {

	 @Autowired
	 private SqlSession sqlsession;

	
	public Emp selectEmpId(int emp){
		return null;
	}
}
