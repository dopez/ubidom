package com.ubi.erp.prod2.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod2.dao.MonthlyPlanR2Dao;

@Service
public class MonthlyPlanR2Service {

	private MonthlyPlanR2Dao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(MonthlyPlanR2Dao.class);
	}

	public void selMonthlyPlanR2(Map<String, Object> map) {
		dao.selMonthlyPlanR2(map);
	}

}
