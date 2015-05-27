package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.MonthByJoinRetireRDao;

@Service
public class MonthByJoinRetireRService {
	private MonthByJoinRetireRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(MonthByJoinRetireRDao.class);
	}

	public void selMonthByJoinRetireR(Map<String, Object> map) {
		dao.selMonthByJoinRetireR(map);
	}
}
