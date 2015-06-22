package com.ubi.erp.prod1.dao;

import java.util.Map;

import com.ubi.erp.prod1.domain.LineWorkS;

public interface LineWorkSDao {

	void selLineWorkSL(Map<String, Object> param);

	void selLineWorkSR(Map<String, Object> param);

	void prcsLineWorkS(LineWorkS lineWorkS);

}
