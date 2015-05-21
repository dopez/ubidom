package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.FamilyDataS;

public interface FamilyDataSDao {

	void selFamilyDataSL(Map<String, Object> param);

	void selFamilyDataSR(Map<String, Object> param);

	void prcsFamilyDataS(FamilyDataS familyDataS);
}
