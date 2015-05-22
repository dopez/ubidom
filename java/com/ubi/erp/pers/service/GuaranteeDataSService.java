package com.ubi.erp.pers.service;

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

	public void selGuaranteeDataSL(Map<String, Object> map) {
		dao.selGuaranteeDataSL(map);
	}

	public void selGuaranteeDataSR1(Map<String, Object> map) {
		dao.selGuaranteeDataSR1(map);
		;
	}

	public void prcsGuaranteeDataS1(GuaranteeDataS guaranteeDataS) {
		dao.prcsGuaranteeDataS1(guaranteeDataS);
	}

	public void selGuaranteeDataSR2(Map<String, Object> map) {
		dao.selGuaranteeDataSR2(map);
	}

	public void prcsGuaranteeDataS2(GuaranteeDataS guaranteeDataS) {
		dao.prcsGuaranteeDataS2(guaranteeDataS);
	}
}
