package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.DeptSDao;
import com.ubi.erp.pers.domain.Dept;

@Service
public class DeptSService {
	private DeptSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DeptSDao.class);
	}

	public void selDeptS(Map<String, Object> map) {
		dao.selDeptS(map);
	}

	public void crudDeptS(Dept dept) {
		dao.crudDeptS(dept);
	}

	public void selDeptCodeS(Map<String, Object> map) {
		dao.selDeptCodeS(map);
	}

	public int totalDeptS(Dept dept) {
		return dao.totalDeptS(dept);
	}

}
