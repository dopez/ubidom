package com.ubi.erp.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.user.dao.comboTestDao;
import com.ubi.erp.user.domain.comboTest;

@Service
public class comboTestService {
	private comboTestDao dao;

	// prs - 는 프로시저 아닌거는 일반 쿼리문
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(comboTestDao.class);
	}

	public List<comboTest> selComp(comboTest comboTest) {
		return dao.selComp(comboTest);
	}
}
