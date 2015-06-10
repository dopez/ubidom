package com.ubi.erp.rndt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.DevPlanSDao;

@Service
public class DevPlanSService {
	private DevPlanSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DevPlanSDao.class);
	}

	public void selFrmMain(Map<String, Object> map) {
		dao.selFrmMain(map);
		
	}
		
}