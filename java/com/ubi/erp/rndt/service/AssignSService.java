package com.ubi.erp.rndt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.AssignSDao;

@Service
public class AssignSService {
	private AssignSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(AssignSDao.class);
	}

	public void selGridMst(Map<String, Object> map) {
		dao.selGridMst(map);
	}

}