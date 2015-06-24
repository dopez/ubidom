package com.ubi.erp.prod2.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod2.dao.YearlyPlanS2Dao;
import com.ubi.erp.prod2.domain.YearlyPlanS2;

@Service
public class YearlyPlanS2Service {
	
	private YearlyPlanS2Dao dao;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(YearlyPlanS2Dao.class);
	}

	public void selYearlyPlanS2(Map<String, Object> map) {
		dao.selYearlyPlanS2(map);
	}


	public void prcsYearlyPlanS2(List<YearlyPlanS2> list, String sysEmpNo, String compId) {
		for (YearlyPlanS2 yearlyPlanS : list) {
			yearlyPlanS.setCompId(compId);
			yearlyPlanS.setSysEmpNo(sysEmpNo);
			dao.prcsYearlyPlanS2(yearlyPlanS);
		}
	}
}
