package com.ubi.erp.user.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.user.dao.TestDao;
import com.ubi.erp.user.domain.Test;

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

	public void insTest(Test test) {
		dao.insTest(test);
	}
	
	public void updTest(Test test){
		dao.updTest(test);
	}
	
	public void delTest(Test test){
		dao.delTest(test);
	}
}