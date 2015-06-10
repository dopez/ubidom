package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.FixBaseWageR;

public interface FixBaseWageRDao {

	void selFixBaseWageRL(Map<String, Object> param);

	void selFixBaseWageRR(Map<String, Object> param);

	void prcsFixBaseWageR(FixBaseWageR fixBaseWageR);
}
