package com.ubi.erp.pers.service;

import java.util.List;
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

	public void prcsLicenseDataS(List<LicenseDataS> list, String sysEmpNo) {
		for(LicenseDataS licenseDataS : list) {
			licenseDataS.setSysEmpNo(sysEmpNo);
			dao.prcsLicenseDataS(licenseDataS);
		}
		
	}
}
