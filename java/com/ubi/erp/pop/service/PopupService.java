package com.ubi.erp.pop.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pop.dao.PopupDao;

@Service
public class PopupService {

	private PopupDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(PopupDao.class);
	}

	public void selPopLen2(Map<String, Object> map) {
		dao.selPopLen2(map);
	}

	public void selPopLen4(Map<String, Object> map) {
		dao.selPopLen4(map);
	}

	public void selItemAllCode(Map<String, Object> map) {
		dao.selItemAllCode(map);
	}

	public void selSelectMatrCode(Map<String, Object> map) {
		dao.selSelectMatrCode(map);
	}
}
