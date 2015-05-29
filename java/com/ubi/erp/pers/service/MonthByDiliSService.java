package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.MonthByDiliSDao;

@Service
public class MonthByDiliSService {

	private MonthByDiliSDao monthByDiliSDao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		monthByDiliSDao = sqlSession.getMapper(MonthByDiliSDao.class);
	}

	public void selGridMst(Map<String, Object> map) {
		monthByDiliSDao.selGridMst(map);
		
	}
}
