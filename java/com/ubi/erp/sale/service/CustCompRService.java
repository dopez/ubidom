package com.ubi.erp.sale.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.sale.dao.CustCompRDao;


@Service
public class CustCompRService {

	private CustCompRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(CustCompRDao.class);
	}

	public void getSearch(Map<String, Object> map) {
		dao.getSearch(map);
	}
}
