package com.ubi.erp.prod1.dao;

import java.util.Map;

import com.ubi.erp.prod1.domain.YearlyPlanS;

public interface YearlyPlanSDao {

	void selYearlyPlanS(Map<String, Object> param);

	void prcsYearlyPlanS(YearlyPlanS yearlyPlanS);
}
