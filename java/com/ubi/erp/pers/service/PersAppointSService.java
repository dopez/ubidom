package com.ubi.erp.pers.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.PersAppointSDao;
import com.ubi.erp.pers.domain.PersAppointS;

@Service
public class PersAppointSService {
	private PersAppointSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(PersAppointSDao.class);
	}

	public void selPersAppointSL(Map<String, Object> map) {
		dao.selPersAppointSL(map);
	}

	public void selPersAppointSR(Map<String, Object> map) {
		dao.selPersAppointSR(map);
	}

	public void prcsPersAppointS(List<PersAppointS> list, String sysEmpNo) {
		for(PersAppointS persAppointS : list) {
			persAppointS.setSysEmpNo(sysEmpNo);
			dao.prcsPersAppointS(persAppointS);
		}
	}

	public List<PersAppointS> selPersBaseCode(PersAppointS persAppointS) {
		return dao.selPersBaseCode(persAppointS);
	}

}
