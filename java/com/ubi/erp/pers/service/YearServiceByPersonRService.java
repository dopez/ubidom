package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.YearServiceByPersonRDao;

@Service
public class YearServiceByPersonRService {
	private YearServiceByPersonRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(YearServiceByPersonRDao.class);
	}

	public void selYearServiceByPersonRL(Map<String, Object> map) {
		dao.selYearServiceByPersonRL(map);
	}

	public void selYearServiceByPersonRR(Map<String, Object> map) {
		dao.selYearServiceByPersonRR(map);
	}
}
