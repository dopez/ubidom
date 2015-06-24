package com.ubi.erp.prod2.dao;

import java.util.Map;

import com.ubi.erp.prod2.domain.YearlyPlanS2;

public interface YearlyPlanS2Dao {

	void selYearlyPlanS2(Map<String, Object> param);

	void prcsYearlyPlanS2(YearlyPlanS2 yearlyPlanS);
}
