package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.PersDataSDao;
import com.ubi.erp.pers.dao.PositionByPersonRDao;

@Service
public class PositionByPersonRService {

	private PositionByPersonRDao dao;
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(PositionByPersonRDao.class);
	}

	public void selPositionByPersonR(Map<String, Object> param) {
		dao.selPositionByPersonR(param);
	};

}


