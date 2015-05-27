package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.AgeByPersonRDao;

@Service
public class AgeByPersonRService {
	private AgeByPersonRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(AgeByPersonRDao.class);
	}

	public void selAgeByPersonR(Map<String, Object> map) {
		dao.selAgeByPersonR(map);
	}
}
