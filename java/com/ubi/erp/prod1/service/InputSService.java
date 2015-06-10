package com.ubi.erp.prod1.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.InputSDao;
import com.ubi.erp.prod1.domain.InputS;

@Service
public class InputSService {
	
	private InputSDao dao;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(InputSDao.class);
	}

	public void selEquiInputSL(Map<String, Object> map) {
		dao.selEquiInputSL(map);
	}

	public void selEquiInputSR(Map<String, Object> map) {
		dao.selEquiInputSR(map);
	}

	public void prcsEquiInputS(List<InputS> list, String sysEmpNo, String compId, String setDate) {
		for (InputS inputS : list) {
			inputS.setCompId(compId);
			inputS.setSysEmpNo(sysEmpNo);
			inputS.setSetDate(setDate);
			dao.prcsEquiInputS(inputS);
		}
	}
}
