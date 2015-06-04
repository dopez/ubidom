package com.ubi.erp.rndt.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.VaccCoatSDao;
import com.ubi.erp.rndt.domain.VaccCoatS;
import com.ubi.erp.sale.domain.WorkLogS;

@Service
public class VaccCoatSService {
	private VaccCoatSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(VaccCoatSDao.class);
	}

	
	public List<VaccCoatS> selGridMst() {
		return dao.selGridMst();
	}


	public void selGridDtl(Map<String, Object> map) {
		dao.selGridDtl(map);
	}


	public void selPopMain(Map<String, Object> map) {
		dao.selPopMain(map);
		
	}


	public void prcsGridDtl(List<VaccCoatS> list, String sysEmpNo, String compId) {
		for(VaccCoatS vaccCoatS : list) {
			vaccCoatS.setSysEmpNo(sysEmpNo);
			vaccCoatS.setCompId(compId);
			if("INSERT".equals(vaccCoatS.getCudKey())) {
				dao.prcsGridDtl(vaccCoatS);
			} else if ("UPDATE".equals(vaccCoatS.getCudKey())) {
				dao.prcsGridDtl(vaccCoatS);
			} else if ("DELETE".equals(vaccCoatS.getCudKey())) {
				dao.prcsGridDtl(vaccCoatS);
			}
		}		
	}
}