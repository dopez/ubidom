package com.ubi.erp.prod1.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.OrderRDao;

@Service
public class OrderRService {

	private OrderRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(OrderRDao.class);
	}

	public void selEquiOrderR(Map<String, Object> map) {
		dao.selEquiOrderR(map);
	}
}
