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

	public void selBaseCodeMst(Map<String, Object> map) {
		dao.selBaseCodeMst(map);
		
	}

	public void prcsCodeSave(BaseCodeS basecodss) {
		dao.prcsCodeSave(basecodss);
		
	}

	public void prcsCodeDtlSave(BaseCodeS basecodss) {
		dao.prcsCodeDtlSave(basecodss);
		
	}

	public void selBaseCodeDtl(Map<String, Object> map) {
		dao.selBaseCodeDtl(map);
		
	}
}