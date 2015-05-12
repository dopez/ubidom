package com.ubi.erp.rndt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.domain.BaseCodeR;
import com.ubi.erp.rndt.dao.BaseCodeRDao;

@Service
public class BaseCodeRService {
	private BaseCodeRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(BaseCodeRDao.class);
	}

	public void selBaseCodeR(Map<String, Object> map) {
		dao.selBaseCodeR(map);
		
	}

}
