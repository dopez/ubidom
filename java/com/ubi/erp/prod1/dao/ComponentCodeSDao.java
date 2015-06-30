package com.ubi.erp.prod1.dao;

import java.util.Map;

import com.ubi.erp.prod1.domain.ComponentCodeS;

public interface ComponentCodeSDao {

	void selComponentCodeSL(Map<String, Object> param);

	void selComponentCodeSR(Map<String, Object> param);

	void prcsComponentCodeS(ComponentCodeS componentCodeS);
}
