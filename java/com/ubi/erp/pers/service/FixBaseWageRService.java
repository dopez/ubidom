package com.ubi.erp.pers.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.FixBaseWageRDao;
import com.ubi.erp.pers.domain.FixBaseWageR;

@Service
public class FixBaseWageRService {

	private FixBaseWageRDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(FixBaseWageRDao.class);
	}

	public void selFixBaseWageRL(Map<String, Object> map) {
		dao.selFixBaseWageRL(map);
	}

	public void selFixBaseWageRR(Map<String, Object> map) {
		dao.selFixBaseWageRR(map);
	}

	public void prcsFixBaseWageR(List<FixBaseWageR> list, String compId, String sysEmpNo) {
		for(FixBaseWageR fixBaseWageR : list) {
			fixBaseWageR.setSysEmpNo(sysEmpNo);
			fixBaseWageR.setCompId(compId);
			dao.prcsFixBaseWageR(fixBaseWageR);
		}
		
	}
}
