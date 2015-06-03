package com.ubi.erp.sale.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.sale.dao.WorkLogAllRDao;
import com.ubi.erp.sale.dao.WorkLogPersRDao;

@Service
public class WorkLogAllRService {
	private WorkLogAllRDao workLogAllRDao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		workLogAllRDao = sqlSession.getMapper(WorkLogAllRDao.class);
	}
	public void selGridMain(Map<String, Object> map) {
		workLogAllRDao.selGridMain(map);
		
	}
	public void selGridDtl(Map<String, Object> map) {
		workLogAllRDao.selGridDtl(map);
		
	}
	public void selGridMainProd1(Map<String, Object> map) {
		workLogAllRDao.selGridMainProd1(map);
		
	}
	public void selGridMainRndt(Map<String, Object> map) {
		workLogAllRDao.selGridMainRndt(map);
		
	}
}