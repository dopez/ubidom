package com.ubi.erp.pers.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.ProvDeductSetSDao;
import com.ubi.erp.pers.domain.ProvDeductSetS;

@Service
public class ProvDeductSetSService {

	private ProvDeductSetSDao dao;

	@Autowired
	public void setSqlSesstion(SqlSession sqlSession) {
		dao = sqlSession.getMapper(ProvDeductSetSDao.class);
	}

	public void selProvDeductSetS(Map<String, Object> map) {
		dao.selProvDeductSetS(map);
	}

	public void prcsProvDeductSetS(List<ProvDeductSetS> list, String compId, String sysEmpNo) {
		for(ProvDeductSetS provDeductSetS : list) {
			provDeductSetS.setSysEmpNo(sysEmpNo);
			provDeductSetS.setCompId(compId);
			dao.prcsProvDeductSetS(provDeductSetS);
		}
		
	}
}
