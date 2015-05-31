package com.ubi.erp.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.user.domain.Menu;
import com.ubi.erp.user.domain.User;

@Repository
public interface UserDao {

	List<Map<String, Object>> selItem();

	User getUser(Map<String, Object> param);

	List<Map<String, Object>> selUser();

	List<Map<String, Object>> selSub1();

	List<Map<String, Object>> selSub2();

	List<Menu> selMenu();
	
	void getMenu(Map<String, Object> param);
}