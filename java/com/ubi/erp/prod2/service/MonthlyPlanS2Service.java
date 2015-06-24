package com.ubi.erp.prod2.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod2.dao.MonthlyPlanS2Dao;
import com.ubi.erp.prod2.domain.MonthlyPlanS2;

@Service
public class MonthlyPlanS2Service {
	
	private MonthlyPlanS2Dao dao;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(MonthlyPlanS2Dao.class);
	}

	public void selMonthlyPlanS2(Map<String, Object> map) {
		dao.selMonthlyPlanS2(map);
	}


	public void prcsMonthlyPlanS2(List<MonthlyPlanS2> list, String sysEmpNo, String compId) {
		for (MonthlyPlanS2 monthlyPlanS : list) {
			monthlyPlanS.setCompId(compId);
			monthlyPlanS.setSysEmpNo(sysEmpNo);
			dao.prcsMonthlyPlanS2(monthlyPlanS);
		}
	}
}
