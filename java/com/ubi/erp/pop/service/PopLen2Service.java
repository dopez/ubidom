package com.ubi.erp.pop.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pop.dao.PopLen2Dao;

@Service
public class PopLen2Service {

	private PopLen2Dao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(PopLen2Dao.class);
	}

	public void selPopLen2(Map<String, Object> map) {
		dao.selPopLen2(map);
	}

}
