package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.DayByOvertimeRDao;

@Service
public class DayByOvertimeRService {

	private DayByOvertimeRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DayByOvertimeRDao.class);
	}

	public void selDayByOvertimeR(Map<String, Object> map) {
		dao.selDayByOvertimeR(map);
	}

}
