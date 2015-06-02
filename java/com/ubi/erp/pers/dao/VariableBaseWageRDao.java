package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.VariableBaseWageR;

public interface VariableBaseWageRDao {

	void selVariableBaseWageRL(Map<String, Object> param);

	void selVariableBaseWageRR(Map<String, Object> param);

	void prcsVariableBaseWageR(VariableBaseWageR variableBaseWageR);
}
