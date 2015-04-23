package com.ubi.erp.user.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.user.dao.TestDao;

@Service
public class TestService {
	private TestDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(TestDao.class);
	}

	public void selTest(Map<String, Object> map) {
		dao.selTest(map);
	}

}