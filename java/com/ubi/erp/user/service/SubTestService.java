package com.ubi.erp.user.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.user.dao.SubTestDao;
import com.ubi.erp.user.domain.SubTest;

@Service
public class SubTestService {
	private SubTestDao dao;

	// prs - 는 프로시저 아닌거는 일반 쿼리문
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(SubTestDao.class);
	}

	public void prsSelTest(Map<String, Object> map) {
		dao.prsSelTest(map);
	}
	
	public void prsInsTest(SubTest subTest) {
		dao.prsInsTest(subTest);
	}

	public void prsUpdTest(SubTest subTest) {
		dao.prsUpdTest(subTest);
	}

	public void prsDelTest(SubTest subTest) {
		dao.prsDelTest(subTest);
	}

	public int insTest(SubTest subTest) {
		return dao.insTest(subTest);
	}

	public int updTest(SubTest subTest) {
		return dao.updTest(subTest);
	}

	public int delTest(SubTest subTest) {
		return dao.delTest(subTest);
	}

	public List<SubTest> selTest(SubTest subTest) {
		return dao.selTest(subTest);
	}
	
	public List<Map<String, Object>> reportTest(){
		return dao.reportTest();
	}
}