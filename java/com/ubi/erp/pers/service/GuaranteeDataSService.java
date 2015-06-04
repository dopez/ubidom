package com.ubi.erp.pers.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.GuaranteeDataSDao;
import com.ubi.erp.pers.domain.GuaranteeDataS;

@Service
public class GuaranteeDataSService {
	private GuaranteeDataSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(GuaranteeDataSDao.class);
	}

	public void selGuaranteeDataSR1(Map<String, Object> map) {
		dao.selGuaranteeDataSR1(map);
	}

	public void prcsGuaranteeDataS1(List<GuaranteeDataS> list, String sysEmpNo) {
		for(GuaranteeDataS guaranteeDataS : list) {
			guaranteeDataS.setSysEmpNo(sysEmpNo);
			dao.prcsGuaranteeDataS1(guaranteeDataS);
		}
	}

	public void selGuaranteeDataSR2(Map<String, Object> map) {
		dao.selGuaranteeDataSR2(map);
	}

	public void prcsGuaranteeDataS2(List<GuaranteeDataS> list, String sysEmpNo) {
		for(GuaranteeDataS guaranteeDataS : list) {
			guaranteeDataS.setSysEmpNo(sysEmpNo);
			dao.prcsGuaranteeDataS2(guaranteeDataS);
		}
		
	}
}
