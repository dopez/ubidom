package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.DeptS;

public interface DeptSDao {

	void selDeptS(Map<String, Object> param);

	void prcsDeptS(DeptS deptS);

	void selDeptCodeS(Map<String, Object> param);

}
