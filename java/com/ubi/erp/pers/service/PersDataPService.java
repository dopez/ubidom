package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.PersDataPDao;

@Service
public class PersDataPService {

	private PersDataPDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(PersDataPDao.class);
	}

	public void selPersData(Map<String, Object> map) {
		dao.selPersData(map);
		
	}
	
}
