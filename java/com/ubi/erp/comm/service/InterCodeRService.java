package com.ubi.erp.comm.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.comm.dao.InterCodeRDao;

@Service
public class InterCodeRService {
	private InterCodeRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(InterCodeRDao.class);
	}

	public void selInterCode(Map<String, Object> map) {
		dao.selInterCode(map);
		
	}
}