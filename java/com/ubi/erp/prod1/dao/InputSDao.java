package com.ubi.erp.prod1.dao;

import java.util.Map;

import com.ubi.erp.prod1.domain.InputS;

public interface InputSDao {

	void selEquiInputSL(Map<String, Object> param);

	void selEquiInputSR(Map<String, Object> param);

	void prcsEquiInputS(InputS inputS);
}
