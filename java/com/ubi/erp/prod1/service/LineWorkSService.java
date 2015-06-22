package com.ubi.erp.prod1.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.LineWorkSDao;
import com.ubi.erp.prod1.domain.LineWorkS;

@Service
public class LineWorkSService {
	private LineWorkSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(LineWorkSDao.class);
	}

	public void selLineWorkSL(Map<String, Object> map) {
		dao.selLineWorkSL(map);
	}

	public void selLineWorkSR(Map<String, Object> map) {
		dao.selLineWorkSR(map);
	}

	public void prcsLineWorkS(List<LineWorkS> list, String sysEmpNo, String compId) {
		for (LineWorkS lineWorkS : list) {
			lineWorkS.setCompId(compId);
			lineWorkS.setSysEmpNo(sysEmpNo);
			dao.prcsLineWorkS(lineWorkS);
		}
	}
}
