package com.ubi.erp.system.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.system.domain.MenuS;

@Repository
public interface MenuSDao {
	void selMenu(Map<String, Object> param);

	void selMenuDtl(Map<String, Object> map);

	void prcsMenuS(MenuS menuS);

	void selNoAuthList(Map<String, Object> map);

	void selAuthList(Map<String, Object> map);

	void prcsAuthSave(MenuS menuS);
}