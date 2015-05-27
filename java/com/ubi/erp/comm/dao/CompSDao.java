package com.ubi.erp.comm.dao;

import java.util.Map;

import com.ubi.erp.comm.domain.CompS;

public interface CompSDao {

	void selCompSL(Map<String, Object> param);

	void selCompSR(Map<String, Object> param);

	void prcsCompS(CompS compS);
}
