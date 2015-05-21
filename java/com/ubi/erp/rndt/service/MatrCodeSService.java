package com.ubi.erp.rndt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.MatrCodeSDao;
import com.ubi.erp.rndt.domain.MatrCodeS;

@Service
public class MatrCodeSService {

	private MatrCodeSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(MatrCodeSDao.class);
	}

	public void prcsMatrCodeS(MatrCodeS matrCodeS) {
		dao.prcsMatrCodeS(matrCodeS);
		
	}

	public void selGridMain(Map<String, Object> map) {
		dao.selGridMain(map);
		
	}

	public void selFormMain(Map<String, Object> map) {
		dao.selFormMain(map);
		
	}

}
