package com.ubi.erp.prod1.dao;

import java.util.Map;

import com.ubi.erp.prod1.domain.MonthlyPlanS;

public interface MonthlyPlanSDao {

	void selMonthlyPlanS(Map<String, Object> param);

	void prcsMonthlyPlanS(MonthlyPlanS monthlyPlanS);
}
