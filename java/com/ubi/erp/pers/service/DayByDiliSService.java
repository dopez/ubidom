package com.ubi.erp.pers.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.DayByDiliSDao;
import com.ubi.erp.pers.domain.DayByDiliS;

@Service
public class DayByDiliSService {

	private DayByDiliSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DayByDiliSDao.class);
	}

	public void selDayByDiliS(Map<String, Object> map) {
		dao.selDayByDiliS(map);
	}

	public void prcsDayByDiliS(List<DayByDiliS> list, String sysEmpNo) {
		for(DayByDiliS dayByDiliS : list) {
			dayByDiliS.setSysEmpNo(sysEmpNo);
			dao.prcsDayByDiliS(dayByDiliS);
		}
	}
	
	public void selDayByDiliSPopC(Map<String, Object> map) {
		dao.selDayByDiliSPopC(map);
	}

	public void prcsDayByDiliSPopI(DayByDiliS dayByDiliS) {
		dao.prcsDayByDiliSPopI(dayByDiliS);
	}
}
