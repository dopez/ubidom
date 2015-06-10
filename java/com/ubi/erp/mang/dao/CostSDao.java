package com.ubi.erp.mang.dao;

import java.util.Map;

import com.ubi.erp.mang.domain.CostS;

public interface CostSDao {

	void getSrhA(Map<String, Object> param);

	void getSrhB(Map<String, Object> param);

	void getSrhC(Map<String, Object> param);

	void prcsSaveB(CostS costS);

}
