package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.LicenseDataSDao;
import com.ubi.erp.pers.domain.LicenseDataS;

@Service
public class LicenseDataSService {

	private LicenseDataSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(LicenseDataSDao.class);
	}
	
	public void selLicenseDataSR(Map<String, Object> map) {
		dao.selLicenseDataSR(map);
	}

	public void prcsLicenseDataS(LicenseDataS licenseDataS) {
		dao.prcsLicenseDataS(licenseDataS);
	}
}
