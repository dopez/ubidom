package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public interface DevPlanSDao {
	void selFrmMain(Map<String, Object> map);
}
