package com.ubi.erp.prod1.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.InputRDao;

@Service
public class InputRService {

	private InputRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(InputRDao.class);
	}

	public void selEquiInputR(Map<String, Object> map) {
		dao.selEquiInputR(map);
	}

}
