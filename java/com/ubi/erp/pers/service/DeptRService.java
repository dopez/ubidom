package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.DeptRDao;

@Service
public class DeptRService {
	private DeptRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DeptRDao.class);
	}

	public void selDeptR(Map<String, Object> map) {
		dao.selDeptR(map);
	}

}
