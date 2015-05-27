package com.ubi.erp.comm.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.comm.dao.CustCodeRDao;

@Service
public class CustCodeRService {
	private CustCodeRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(CustCodeRDao.class);
	}

	public void selCustCode(Map<String, Object> map) {
		dao.selCustCode(map);
		
	}
}