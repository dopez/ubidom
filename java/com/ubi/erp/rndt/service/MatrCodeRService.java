package com.ubi.erp.rndt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.MatrCodeRDao;

@Service
public class MatrCodeRService {

	private MatrCodeRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(MatrCodeRDao.class);
	}

	public void selMatrCode(Map<String, Object> map) {
		dao.selMatrCode(map);
		
	}

}
