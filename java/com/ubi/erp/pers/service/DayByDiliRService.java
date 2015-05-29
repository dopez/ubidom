package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.DayByDiliRDao;

@Service
public class DayByDiliRService {

	private DayByDiliRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DayByDiliRDao.class);
	}

	public void selDayByDiliR(Map<String, Object> map) {
		dao.selDayByDiliR(map);
	}

}
