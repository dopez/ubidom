package com.ubi.erp.rndt.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.ImpReqSDao;
import com.ubi.erp.rndt.domain.ImpReqS;

@Service
public class ImpReqSService {
	private ImpReqSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(ImpReqSDao.class);
	}

	public void prcsGridMain(List<ImpReqS> list, String sysEmpNo, String compId) {
		for (ImpReqS ImpReqS : list) {
			ImpReqS.setSysEmpNo(sysEmpNo);
			ImpReqS.setCompId(compId);
			dao.prcsGridMain(ImpReqS);
		}
	}

}