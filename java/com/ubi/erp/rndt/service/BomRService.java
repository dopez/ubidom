package com.ubi.erp.rndt.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.BomRDao;
import com.ubi.erp.rndt.domain.BomR;

@Service
public class BomRService {
	private BomRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(BomRDao.class);
	}

	public void selItemCodePop(Map<String, Object> map) {
		dao.selItemCodePop(map);
		
	}

	public void selGridMain(Map<String, Object> map) {
		dao.selGridMain(map);
		
	}
		
}