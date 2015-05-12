package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.Dept;

public interface DeptRDao {

	void selDeptR(Map<String, Object> param);

	int totalDeptR(Dept dept);
}
