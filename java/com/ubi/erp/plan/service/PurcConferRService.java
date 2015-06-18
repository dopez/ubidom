package com.ubi.erp.plan.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.plan.dao.PurcConferRDao;

@Service
public class PurcConferRService {
	
	private PurcConferRDao purcConferRDao;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		purcConferRDao = sqlSession.getMapper(PurcConferRDao.class);
	}	
	
	public void gridMainSel(Map<String, Object> map) {
		purcConferRDao.gridMainSel(map);
	}
	
	public void getSeqReturn(Map<String, Object> map) {
		purcConferRDao.getSeqReturn(map);
	}	

}
