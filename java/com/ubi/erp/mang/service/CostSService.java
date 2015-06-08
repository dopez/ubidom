package com.ubi.erp.mang.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.mang.dao.CostSDao;

@Service
public class CostSService {
	private CostSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(CostSDao.class);
	}
}
