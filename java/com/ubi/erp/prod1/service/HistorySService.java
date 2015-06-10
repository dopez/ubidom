package com.ubi.erp.prod1.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.HistorySDao;
import com.ubi.erp.prod1.domain.HistoryS;

@Service
public class HistorySService {

	private HistorySDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(HistorySDao.class);
	}

	public void selEquiHistorySL(Map<String, Object> map) {
		dao.selEquiHistorySL(map);
	}

	public void selEquiHistorySR(Map<String, Object> map) {
		dao.selEquiHistorySR(map);
	}

	public void prcsEquiHistoryS(HistoryS historyS) {
		dao.prcsEquiHistoryS(historyS);
	}
	
	public void selEquiCode(Map<String, Object> map) {
		dao.selEquiCode(map);
	}
}
