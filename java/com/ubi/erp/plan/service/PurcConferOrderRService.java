package com.ubi.erp.plan.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.plan.dao.PurcConferOrderRDao;

@Service
public class PurcConferOrderRService {
	
	private PurcConferOrderRDao purcConferOrderRDao;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		purcConferOrderRDao = sqlSession.getMapper(PurcConferOrderRDao.class);
	}	
	
	public void gridMainSel(Map<String, Object> map) {
		purcConferOrderRDao.gridMainSel(map);
	}
	
	public void getSeqReturn(Map<String, Object> map) {
		purcConferOrderRDao.getSeqReturn(map);
	}	

}
