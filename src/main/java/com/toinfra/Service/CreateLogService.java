package com.toinfra.Service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toinfra.DAO.CreateLogDAO;
import com.toinfra.DTO.CreateLog;


@Service
public class CreateLogService {

	@Autowired
	private SqlSession sqlsession;
	
	public void BasicLog(CreateLog log){
		CreateLogDAO createlog = sqlsession.getMapper(CreateLogDAO.class); 
		System.out.println("로그 생성합니다");
		createlog.CreateBasicLog(log);
	}
	
}
