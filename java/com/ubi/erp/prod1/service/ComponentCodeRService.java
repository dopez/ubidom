package com.ubi.erp.prod1.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.ComponentCodeRDao;

@Service
public class ComponentCodeRService {

	private ComponentCodeRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(ComponentCodeRDao.class);
	}

	public void selComponentCodeR(Map<String, Object> map) {
		dao.selComponentCodeR(map);
	}

}
