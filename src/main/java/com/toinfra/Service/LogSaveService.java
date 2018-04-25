package com.toinfra.Service;

import com.toinfra.DAO.LogSaveDao;
import com.toinfra.DTO.LogSaveDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogSaveService implements LogSaveDao {

    @Autowired
    private SqlSession sqlSession;


    @Override
    public int loghitsave(LogSaveDto lsdto) {
        LogSaveDao lsdao = sqlSession.getMapper(LogSaveDao.class);
        int result = lsdao.loghitsave(lsdto);
        return result;
    }

    @Override
    public int loghstsave(LogSaveDto lsdto) {
        LogSaveDao lsdao = sqlSession.getMapper(LogSaveDao.class);
        int result = lsdao.loghstsave(lsdto);
        return result;
    }
}
