package com.ubi.erp.pers.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.EducationDataSDao;
import com.ubi.erp.pers.domain.EducationDataS;

@Service
public class EducationDataSService {
	private EducationDataSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(EducationDataSDao.class);
	}

	public void selEducationDataSL(Map<String, Object> map) {
		dao.selEducationDataSL(map);
	}

	public void selEducationDataSR(Map<String, Object> map) {
		dao.selEducationDataSR(map);
	}

	public void prcsEducationDataS(List<EducationDataS> list, String sysEmpNo) {
		for(EducationDataS educationDataS : list) {
			educationDataS.setSysEmpNo(sysEmpNo);
			dao.prcsEducationDataS(educationDataS);
		}
		
	}
}
