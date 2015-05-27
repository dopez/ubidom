package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.EducationDataS;

public interface EducationDataSDao {

	void selEducationDataSL(Map<String, Object> param);

	void selEducationDataSR(Map<String, Object> param);

	void prcsEducationDataS(EducationDataS educationDataS);
}
