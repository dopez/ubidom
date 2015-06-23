package com.ubi.erp.plan.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.plan.dao.PurcConferSDao;
import com.ubi.erp.plan.domain.PurcConferS;

@Service
public class PurcConferSService {
	
	private PurcConferSDao purcConferSDao;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		purcConferSDao = sqlSession.getMapper(PurcConferSDao.class);
	}	
	
	public void topMainSel (Map<String, Object>map) {
		purcConferSDao.topMainSel(map);
	}	
	
	public void gridMainSel(Map<String, Object> map) {
		purcConferSDao.gridMainSel(map);
	}
	
	public void getSeqReturn(Map<String, Object> map) {
		purcConferSDao.getSeqReturn(map);
	}

	public void prcsGridTop(PurcConferS purcConferS, String sysEmpNo,String compId) {
		purcConferS.setSysEmpNo(sysEmpNo);
		purcConferS.setCompId(compId);
		purcConferSDao.gridTopSave(purcConferS);
	}		
	
	public void prcsGridMain(List<PurcConferS> list, String sysEmpNo,String compId) {
		for(PurcConferS purcConferS : list) {
			purcConferS.setSysEmpNo(sysEmpNo);
			purcConferS.setCompId(compId);
			purcConferSDao.gridMainSave(purcConferS);
		}		
	}	
	
}
