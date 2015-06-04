package com.ubi.erp.pers.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.FamilyDataSDao;
import com.ubi.erp.pers.domain.FamilyDataS;

@Service
public class FamilyDataSService {
	private FamilyDataSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(FamilyDataSDao.class);
	}

	public void selFamilyDataSL(Map<String, Object> map) {
		dao.selFamilyDataSL(map);
	}

	public void selFamilyDataSR(Map<String, Object> map) {
		dao.selFamilyDataSR(map);
	}

	public void prcsFamilyDataS(List<FamilyDataS> list, String sysEmpNo) {
		for(FamilyDataS familyDataS : list) {
			familyDataS.setSysEmpNo(sysEmpNo);
			dao.prcsFamilyDataS(familyDataS);
		}
	}
}
