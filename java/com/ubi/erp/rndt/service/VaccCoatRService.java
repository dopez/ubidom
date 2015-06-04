package com.ubi.erp.rndt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.VaccCoatRDao;

@Service
public class VaccCoatRService {
	private VaccCoatRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(VaccCoatRDao.class);
	}



	public void selGridMain(Map<String, Object> map) {
		dao.selGridMain(map);
		
	}
}