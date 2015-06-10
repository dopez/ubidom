package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.DayByDiliS;

public interface DayByDiliSDao {

	void selDayByDiliS(Map<String, Object> param);

	void prcsDayByDiliS(DayByDiliS dayByDiliS);
	
	void selDayByDiliSPopC(Map<String, Object> param);

	void prcsDayByDiliSPopI(DayByDiliS dayByDiliS);
}
