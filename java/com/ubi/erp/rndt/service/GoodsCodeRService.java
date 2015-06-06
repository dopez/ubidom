package com.ubi.erp.rndt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.GoodsCodeRDao;

@Service
public class GoodsCodeRService {
	private GoodsCodeRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(GoodsCodeRDao.class);
	}

	public void selGridMain(Map<String, Object> map) {
		dao.selGridMain(map);
	}
		
}