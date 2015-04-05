package com.ubi.erp.user.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.user.dao.UserDao;
import com.ubi.erp.user.domain.Menu;


@Service
public class UserService
{
	private UserDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(UserDao.class);
	}

	public void getUser(Map<String, Object> map) {
		dao.getUser(map);
	}

	public List<Map<String, Object>> selUser() {
		return dao.selUser();
	}

	public List<Menu> selMenu() {
		return dao.selMenu();
	}
	public void getMenu(Map<String, Object> param) {
		dao.getMenu(param);
	}
}