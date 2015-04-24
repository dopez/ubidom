package com.ubi.erp.user.service;

import java.util.List;
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


	public Test getTest(String test) {
		return dao.getTest(test);
		
	}
	public Test insTest(Test test) {
		dao.insTest(test);
		return dao.getTest(test.getpCode());
		
	}

	public int updTest(Test test) {
		return dao.updTest(test);
		
	}
	public int delTest(Test test) {
		return dao.delTest(test);
		
	}
	public void prcsTest(List<Test> list) {
		for (Test test : list) {
			if ("CREATE".equals(test.getCudKey())) {
				dao.insTest(test);
			} else if ("UPDATE".equals(test.getCudKey())) {
				dao.updTest(test);
			} else if ("DELETE".equals(test.getCudKey())) {
				dao.delTest(test);
			}
		}
	}

}