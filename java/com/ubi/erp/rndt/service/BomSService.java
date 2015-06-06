package com.ubi.erp.rndt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.BomSDao;

@Service
public class BomSService {
	private BomSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(BomSDao.class);
	}
	public void selGridItem(Map<String, Object> map) {
		dao.selGridItem(map);
		
	}
		
}