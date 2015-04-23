package com.ubi.erp.user.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface TestDao
{
	void selTest(Map<String, Object> param);
}
