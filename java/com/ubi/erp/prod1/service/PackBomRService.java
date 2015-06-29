package com.ubi.erp.prod1.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.PackBomRDao;

@Service
public class PackBomRService {

	private PackBomRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(PackBomRDao.class);
	}

	public void selPackBomR(Map<String, Object> map) {
		dao.selPackBomR(map);
	}

}
