package com.ubi.erp.prod1.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.InspRDao;

@Service
public class InspRService {

	private InspRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(InspRDao.class);
	}

	public void selEquiInspR(Map<String, Object> map) {
		dao.selEquiInspR(map);
	}

}
