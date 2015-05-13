package com.ubi.erp.system.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface MenuSDao {
	void getMenu(Map<String, Object> param);

	void selMenucd(Map<String, Object> map);
}