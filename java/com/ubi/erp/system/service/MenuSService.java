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

	public void selMenu(Map<String, Object> param) {
		dao.selMenu(param);
	}

	public void selMenuDtl(Map<String, Object> map) {
		dao.selMenuDtl(map);
		
	}

	public void prcsMenuS(MenuS menuS) {
		dao.prcsMenuS(menuS);
		
	}

	public void selNoAuthList(Map<String, Object> map) {
		dao.selNoAuthList(map);
	}

	public void selAuthList(Map<String, Object> map) {
		dao.selAuthList(map);
		
	}

	public void prcsAuthSave(MenuS menuS) {
		dao.prcsAuthSave(menuS);		
	}
}