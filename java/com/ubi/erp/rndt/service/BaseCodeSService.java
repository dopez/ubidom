package com.ubi.erp.rndt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.BaseCodeSDao;
import com.ubi.erp.rndt.domain.BaseCodeS;

@Service
public class BaseCodeSService {
	private BaseCodeSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(BaseCodeSDao.class);
	}

	public void selBaseCode(Map<String, Object> map) {
		dao.selBaseCode(map);
		
	}

	public void crudRndt(BaseCodeS basecodss) {
		dao.crudRndt(basecodss);
		
	}

	public void crudDtlRndt(BaseCodeS basecodss) {
		dao.crudDtlRndt(basecodss);
		
	}

	public void selInterCode(Map<String, Object> map) {
		dao.selInterCode(map);
		
	}
}