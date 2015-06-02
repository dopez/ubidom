package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.VariableBaseWageRDao;
import com.ubi.erp.pers.domain.VariableBaseWageR;

@Service
public class VariableBaseWageRService {

	private VariableBaseWageRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(VariableBaseWageRDao.class);
	}

	public void selVariableBaseWageRL(Map<String, Object> map) {
		dao.selVariableBaseWageRL(map);
	}

	public void selVariableBaseWageRR(Map<String, Object> map) {
		dao.selVariableBaseWageRR(map);
	}

	public void prcsVariableBaseWageR(VariableBaseWageR variableBaseWageR) {
		dao.prcsVariableBaseWageR(variableBaseWageR);
	}
}
