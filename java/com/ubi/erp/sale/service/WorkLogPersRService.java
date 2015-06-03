package com.ubi.erp.sale.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.sale.dao.WorkLogPersRDao;

@Service
public class WorkLogPersRService {
	private WorkLogPersRDao workLogPersRDao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		workLogPersRDao = sqlSession.getMapper(WorkLogPersRDao.class);
	}
	public void selGridMain(Map<String, Object> map) {
		workLogPersRDao.selGridMain(map);
		
	}
	public void selGridMainProd1(Map<String, Object> map) {
		workLogPersRDao.selGridMainProd1(map);
		
	}
	public void selGridMainRndt(Map<String, Object> map) {
		workLogPersRDao.selGridMainRndt(map);
		
	}
}