package com.ubi.erp.rndt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.DevPlanRDao;

@Service
public class DevPlanRService {
	private DevPlanRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DevPlanRDao.class);
	}

	/**
	 * 1.개요 :
	 * 
	 * 2.파라미터 :
	 * 
	 * 3.리턴값 : void
	 * 
	 * @name_ko
	 * @param
	 */
	public void selGridMain(Map<String, Object> map) {
		dao.selGridMain(map);
	}

}