package com.ubi.erp.rndt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.RndtDao;
import com.ubi.erp.rndt.domain.Rndt;

@Service
public class RndtService {
	private RndtDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(RndtDao.class);
	}

	public void selBaseCode(Map<String, Object> map) {
		dao.selBaseCode(map);
		
	}

	public void crudRndt(Rndt rndt) {
		dao.crudRndt(rndt);
		
	}

	public void crudDtlRndt(Rndt rndt) {
		dao.crudDtlRndt(rndt);
		
	}
}