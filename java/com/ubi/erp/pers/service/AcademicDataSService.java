package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.AcademicDataSDao;
import com.ubi.erp.pers.domain.AcademicDataS;

@Service
public class AcademicDataSService {
	private AcademicDataSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(AcademicDataSDao.class);
	}

	public void selAcademicDataSR(Map<String, Object> map) {
		dao.selAcademicDataSR(map);
	}

	public void prcsAcademicDataS(AcademicDataS academicDataS) {
		dao.prcsAcademicDataS(academicDataS);
	}
}
