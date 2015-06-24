package com.ubi.erp.prod2.dao;

import java.util.Map;

import com.ubi.erp.prod2.domain.MonthlyPlanS2;

public interface MonthlyPlanS2Dao {

	void selMonthlyPlanS2(Map<String, Object> param);

	void prcsMonthlyPlanS2(MonthlyPlanS2 monthlyPlanS2);
}
