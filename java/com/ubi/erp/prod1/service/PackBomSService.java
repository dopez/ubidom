package com.ubi.erp.prod1.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.PackBomSDao;

@Service
public class PackBomSService {

	private PackBomSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(PackBomSDao.class);
	}

	public void selPackBomSTree(Map<String, Object> map) {
		dao.selPackBomSTree(map);
	}

}
