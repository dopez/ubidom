package com.ubi.erp.prod1.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.YearlyPlanRDao;

@Service
public class YearlyPlanRService {

	private YearlyPlanRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(YearlyPlanRDao.class);
	}

	public void selYearlyPlanR(Map<String, Object> map) {
		dao.selYearlyPlanR(map);
	}

}
