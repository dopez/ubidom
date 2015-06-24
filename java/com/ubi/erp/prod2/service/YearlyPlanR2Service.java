package com.ubi.erp.prod2.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod2.dao.YearlyPlanR2Dao;

@Service
public class YearlyPlanR2Service {

	private YearlyPlanR2Dao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(YearlyPlanR2Dao.class);
	}

	public void selYearlyPlanR2(Map<String, Object> map) {
		dao.selYearlyPlanR2(map);
	}

}
