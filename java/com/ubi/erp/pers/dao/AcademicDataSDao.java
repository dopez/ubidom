package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.AcademicDataS;

public interface AcademicDataSDao {

	void selAcademicDataSL(Map<String, Object> param);

	void selAcademicDataSR(Map<String, Object> param);

	void prcsAcademicDataS(AcademicDataS academicDataS);
}
