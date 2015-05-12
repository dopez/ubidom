package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.Dept;

public interface DeptSDao {

	void selDeptS(Map<String, Object> param);

	void crudDeptS(Dept dept);

	void selDeptCodeS(Map<String, Object> param);

	int totalDeptS(Dept dept);

}
