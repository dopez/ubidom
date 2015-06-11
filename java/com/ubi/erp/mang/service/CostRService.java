package com.ubi.erp.mang.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ubi.erp.mang.dao.CostRDao;


public class CostRService {

	private CostRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(CostRDao.class);
	}

	public void getSrhA(Map<String, Object> param) {
    	dao.getSrhA(param);
    }
}
