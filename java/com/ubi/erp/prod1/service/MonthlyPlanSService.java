package com.ubi.erp.prod1.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.MonthlyPlanSDao;
import com.ubi.erp.prod1.domain.MonthlyPlanS;

@Service
public class MonthlyPlanSService {
	
	private MonthlyPlanSDao dao;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(MonthlyPlanSDao.class);
	}

	public void selMonthlyPlanS(Map<String, Object> map) {
		dao.selMonthlyPlanS(map);
	}


	public void prcsMonthlyPlanS(List<MonthlyPlanS> list, String sysEmpNo, String compId) {
		for (MonthlyPlanS monthlyPlanS : list) {
			monthlyPlanS.setCompId(compId);
			monthlyPlanS.setSysEmpNo(sysEmpNo);
			dao.prcsMonthlyPlanS(monthlyPlanS);
		}
	}
}
