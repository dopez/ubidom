package com.ubi.erp.pers.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.CertificateDataSDao;
import com.ubi.erp.pers.domain.CertificateDataS;

@Service
public class CertificateDataSService {
	private CertificateDataSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(CertificateDataSDao.class);
	}

	public void selCertificateDataS(Map<String, Object> map) {
		dao.selCertificateDataS(map);
	}

	public void prcsCertificateDataS(List<CertificateDataS> list,String compId, String sysEmpNo) {
		for(CertificateDataS certificateDataS : list) {
			certificateDataS.setCompId(compId);
			certificateDataS.setSysEmpNo(sysEmpNo);
			dao.prcsCertificateDataS(certificateDataS);
		}
	}

	public void CertificateDataP(Map<String, Object> map) {
		dao.CertificateDataP(map);
	}
}
