package com.ubi.erp.system.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.system.dao.MenuSDao;
import com.ubi.erp.system.domain.MenuS;



@Service
public class MenuSService
{
	private MenuSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(MenuSDao.class);
	}

	public void getMenu(Map<String, Object> param) {
		dao.getMenu(param);
	}

	public void selMenucd(Map<String, Object> map) {
		dao.selMenucd(map);
		
	}

	public void crudMenuS(MenuS menuS) {
		dao.crudMenuS(menuS);
		
	}
}