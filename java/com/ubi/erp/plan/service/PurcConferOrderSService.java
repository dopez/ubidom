package com.ubi.erp.plan.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.plan.dao.PurcConferOrderSDao;
import com.ubi.erp.plan.domain.PurcConferOrderS;

@Service
public class PurcConferOrderSService {
	
	private PurcConferOrderSDao purcConferOrderSDao;  
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		purcConferOrderSDao = sqlSession.getMapper(PurcConferOrderSDao.class);
	}	
	
	public void topMainSel (Map<String, Object>map) {
		purcConferOrderSDao.topMainSel(map);
	}	
	
	public void gridMainSel(Map<String, Object> map) {
		purcConferOrderSDao.gridMainSel(map);
	}
	
	public void getSeqReturn(Map<String, Object> map) {
		purcConferOrderSDao.getSeqReturn(map);
	}

	public void prcsGridTop(PurcConferOrderS orderS, String sysEmpNo,String compId) {
		orderS.setSysEmpNo(sysEmpNo);
		orderS.setCompId(compId);
		purcConferOrderSDao.gridTopSave(orderS);
	}		
	
	public void prcsGridMain(List<PurcConferOrderS> list, String sysEmpNo,String compId) {
		for(PurcConferOrderS orderS : list) {
			orderS.setSysEmpNo(sysEmpNo);
			orderS.setCompId(compId);
			purcConferOrderSDao.gridMainSave(orderS);
		}		
	}	
	
}
