package com.ubi.erp.prod1.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.HistorySPopDao;
import com.ubi.erp.prod1.domain.HistorySPop;

@Service
public class HistorySPopService {

	private HistorySPopDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(HistorySPopDao.class);
	}

	public void selEquiCheck(Map<String, Object> map) {
		dao.selEquiCheck(map);
	}

	public void prcsEquiCheck(List<HistorySPop> list,String sysEmpNo,String compId) {
		for(HistorySPop historySPop : list) {
			historySPop.setCompId(compId);
			historySPop.setSysEmpNo(sysEmpNo);
			dao.prcsEquiCheck(historySPop);
		}
	}
	
	public void selPartCodeHistory(Map<String, Object> map) {
		dao.selPartCodeHistory(map);
	}

	public void prcsPartCodeHistory(List<HistorySPop> list,String sysEmpNo,String compId) {
		for(HistorySPop historySPop : list) {
			historySPop.setCompId(compId);
			historySPop.setSysEmpNo(sysEmpNo);
			dao.prcsPartCodeHistory(historySPop);
		}
	}
	
	public void selPartCode(Map<String, Object> map) {
		dao.selPartCode(map);
	}
}
