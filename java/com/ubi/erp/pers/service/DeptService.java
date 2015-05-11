package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.DeptDao;
import com.ubi.erp.pers.domain.Dept;
@Service
public class DeptService {
	private DeptDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DeptDao.class);
	}

	public void selDept(Map<String, Object> map) {
		dao.selDept(map);
	}

	public void crudDept(Dept dept) {
		dao.crudDept(dept);
	}

}
