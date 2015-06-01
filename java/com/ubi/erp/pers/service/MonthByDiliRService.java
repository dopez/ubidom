package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.MonthByDiliRDao;

@Service
public class MonthByDiliRService {

	private MonthByDiliRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(MonthByDiliRDao.class);
	}

	public void selMonthByDiliR(Map<String, Object> map) {
		dao.selMonthByDiliR(map);

	}
}
