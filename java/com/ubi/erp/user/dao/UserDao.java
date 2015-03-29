package com.ubi.erp.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.user.domain.Menu;
import com.ubi.erp.user.domain.User;

@Repository
public interface UserDao {

	User getUser(Map<String, Object> param);

	List<Menu> selMenu();
	
	void getMenu(Map<String, Object> param);
}