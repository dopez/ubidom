package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.Dept;

public interface DeptDao {

	void selDept(Map<String, Object> param);

	void crudDept(Dept dept);

	void selDeptCode(Map<String, Object> param);

}
