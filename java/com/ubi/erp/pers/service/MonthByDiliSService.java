package com.ubi.erp.pers.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.MonthByDiliSDao;
import com.ubi.erp.pers.domain.MonthByDiliS;

@Service
public class MonthByDiliSService {

	private MonthByDiliSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(MonthByDiliSDao.class);
	}

	public void selMonthByDiliSL(Map<String, Object> map) {
		dao.selMonthByDiliSL(map);

	}

	public void selMonthByDiliSR(Map<String, Object> map) {
		dao.selMonthByDiliSR(map);

	}

	public void prcsMonthByDiliS(List<MonthByDiliS> list, String sysEmpNo, String monthDate) {
		for(MonthByDiliS monthByDiliS : list) {
			monthByDiliS.setSysEmpNo(sysEmpNo);
			monthByDiliS.setYymm(monthDate);
			dao.prcsMonthByDiliS(monthByDiliS);
		}
	}

	public void selMonthByDiliSPopC(Map<String, Object> map) {
		dao.selMonthByDiliSPopC(map);
	}

	public void prcsMonthByDiliSPopI(MonthByDiliS monthByDiliS) {
		dao.prcsMonthByDiliSPopI(monthByDiliS);
	}
}
