package com.ubi.erp.sale.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.sale.dao.WorkLogSDao;

@Service
public class WorkLogSService {
	private WorkLogSDao workLogSDao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		workLogSDao = sqlSession.getMapper(WorkLogSDao.class);
	}

	public void gridMainSel(Map<String, Object> map) {
		workLogSDao.gridMainSel(map);
		
	}
}