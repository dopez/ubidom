package com.ubi.erp.prod1.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.MonthlyPlanRDao;

@Service
public class MonthlyPlanRService {

	private MonthlyPlanRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(MonthlyPlanRDao.class);
	}

	public void selMonthlyPlanR(Map<String, Object> map) {
		dao.selMonthlyPlanR(map);
	}

}
