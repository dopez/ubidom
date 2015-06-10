package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.MonthByDiliS;

public interface MonthByDiliSDao {

	void selMonthByDiliSL(Map<String, Object> map);

	void selMonthByDiliSR(Map<String, Object> map);

	void prcsMonthByDiliS(MonthByDiliS monthByDiliS);

	void selMonthByDiliSPopC(Map<String, Object> map);

	void prcsMonthByDiliSPopI(MonthByDiliS monthByDiliS);
}
