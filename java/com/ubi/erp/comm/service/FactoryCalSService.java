package com.ubi.erp.comm.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.comm.dao.FactoryCalSDao;
import com.ubi.erp.comm.domain.FactoryCalS;

@Service
public class FactoryCalSService {

	private FactoryCalSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(FactoryCalSDao.class);
	}

	public void selFactoryCalS(Map<String, Object> map) {
		dao.selFactoryCalS(map);

	}

	public void initFactoryCalendar(Map<String, Object> map) {
		dao.initFactoryCalendar(map);

	}

	public void saveFactoryCalS(FactoryCalS factoryCalS) {
		dao.saveFactoryCalS(factoryCalS);

	}

}
