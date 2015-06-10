package com.ubi.erp.comm.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.comm.dao.TableSeqDao;

@Service
public class TableSeqService {
	private TableSeqDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(TableSeqDao.class);
	}

	public void selTableSeq1(Map<String, Object> map) {
		dao.selTableSeq1(map);
	}
	
	public void selTableSeq2(Map<String, Object> map) {
		dao.selTableSeq2(map);
	}
	
	public void selTableSeq3(Map<String, Object> map) {
		dao.selTableSeq3(map);
	}
}
