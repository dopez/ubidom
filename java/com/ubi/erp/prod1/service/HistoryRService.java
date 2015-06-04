package com.ubi.erp.prod1.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.HistoryRDao;

@Service
public class HistoryRService {

	private HistoryRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(HistoryRDao.class);
	}

	public void selEquiHistoryR(Map<String, Object> map) {
		dao.selEquiHistoryR(map);
	}

}
