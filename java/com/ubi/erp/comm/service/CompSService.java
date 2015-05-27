package com.ubi.erp.comm.service;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ubi.erp.comm.dao.CompSDao;
import com.ubi.erp.comm.domain.CompS;

@Service
public class CompSService {
	private CompSDao dao;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(CompSDao.class);
	}

	public void selCompSL(Map<String, Object> map) {
		dao.selCompSL(map);
	}

	public void selCompSR(Map<String, Object> map) {
		dao.selCompSR(map);
	}

	public void prcsCompS(CompS compS) {
		dao.prcsCompS(compS);
	}
}
