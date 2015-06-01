package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.ProvDeductSetS;

public interface ProvDeductSetSDao {

	void selProvDeductSetS(Map<String, Object> param);

	void prcsProvDeductSetS(ProvDeductSetS provDeductSetS);
}
