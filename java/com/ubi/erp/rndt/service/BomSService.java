package com.ubi.erp.rndt.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.BomSDao;
import com.ubi.erp.rndt.domain.BomS;
import com.ubi.erp.rndt.domain.VaccCoatS;

@Service
public class BomSService {
	private BomSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(BomSDao.class);
	}
	public void selGridItem(Map<String, Object> map) {
		dao.selGridItem(map);
		
	}
	public void selGridMst(Map<String, Object> map) {
		dao.selGridMst(map);
		
	}
	public void prcsFrmMainSave(BomS bomS) {
		dao.prcsFrmMainSave(bomS);
		
	}
	public void selFrmMain(Map<String, Object> map) {
		dao.selFrmMain(map);
		
	}
	public void selGridDtl(Map<String, Object> map) {
		dao.selGridDtl(map);
		
	}
	public void selMatrCodePop(Map<String, Object> map) {
		dao.selMatrCodePop(map);
		
	}
	public void prcsGridDtl(List<BomS> list, String sysEmpNo, String compId) {
		for(BomS BomS : list) {
			BomS.setSysEmpNo(sysEmpNo);
			BomS.setCompId(compId);
			dao.prcsGridDtl(BomS);
		}	
		
	}
		
}