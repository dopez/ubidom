package com.ubi.erp.prod1.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.InspSDao;
import com.ubi.erp.prod1.domain.InspS;

@Service
public class InspSService {
	
	private InspSDao dao;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(InspSDao.class);
	}

	public void selEquiInspSL(Map<String, Object> map) {
		dao.selEquiInspSL(map);
	}

	public void selEquiInspSR(Map<String, Object> map) {
		dao.selEquiInspSR(map);
	}

	public void prcsEquiInspS(List<InspS> list,String sysEmpNo, String compId) {
		for(InspS inspS : list) {
			inspS.setCompId(compId);
			inspS.setSysEmpNo(sysEmpNo);
			System.out.println(inspS.getCheckEmp());
			if(inspS.getCheckEmp() == null){
				inspS.setCheckEmp(sysEmpNo);
			}
			dao.prcsEquiInspS(inspS);
		}
	}
}
