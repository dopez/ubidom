package com.ubi.erp.prod1.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.ComponentCodeSDao;
import com.ubi.erp.prod1.domain.ComponentCodeS;

@Service
public class ComponentCodeSService {

	private ComponentCodeSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(ComponentCodeSDao.class);
	}

	public void selComponentCodeSL(Map<String, Object> map) {
		dao.selComponentCodeSL(map);
	}

	public void selComponentCodeSR(Map<String, Object> map) {
		dao.selComponentCodeSR(map);
	}

	public void prcsComponentCodeS(ComponentCodeS componentCodeS) {
		dao.prcsComponentCodeS(componentCodeS);
	}
}
