package com.ubi.erp.prod1.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.YearlyPlanSDao;
import com.ubi.erp.prod1.domain.YearlyPlanS;

@Service
public class YearlyPlanSService {
	
	private YearlyPlanSDao dao;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(YearlyPlanSDao.class);
	}

	public void selYearlyPlanS(Map<String, Object> map) {
		dao.selYearlyPlanS(map);
	}


	public void prcsYearlyPlanS(List<YearlyPlanS> list, String sysEmpNo, String compId) {
		for (YearlyPlanS yearlyPlanS : list) {
			yearlyPlanS.setCompId(compId);
			yearlyPlanS.setSysEmpNo(sysEmpNo);
			dao.prcsYearlyPlanS(yearlyPlanS);
		}
	}
}
