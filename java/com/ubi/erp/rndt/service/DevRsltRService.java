package com.ubi.erp.rndt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.DevRsltRDao;

@Service
public class DevRsltRService {
	private DevRsltRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DevRsltRDao.class);
	}

	public void selGridMain(Map<String, Object> map) {
		dao.selGridMain(map);
	}

}