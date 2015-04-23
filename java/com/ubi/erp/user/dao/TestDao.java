package com.ubi.erp.user.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.user.domain.Test;

@Repository
public interface TestDao
{
	void selTest(Map<String, Object> param);
	
	void insTest(Test test);
	void updTest(Test test);
	void delTest(Test test);
}
