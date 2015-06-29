package com.ubi.erp.prod1.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.PackBomSDao;
import com.ubi.erp.prod1.domain.PackBomS;

@Service
public class PackBomSService {

	private PackBomSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(PackBomSDao.class);
	}

	public void selPackBomSTree(Map<String, Object> map) {
		dao.selPackBomSTree(map);
	}

	public void selPackBomDelChk(Map<String, Object> map) {
		dao.selPackBomDelChk(map);
	}

	public void selPackBomSSch1(Map<String, Object> map) {
		dao.selPackBomSSch1(map);
	}

	public void selPackBomSSch2(Map<String, Object> map) {
		dao.selPackBomSSch2(map);
	}

	public void selPackBomSSch3(Map<String, Object> map) {
		dao.selPackBomSSch3(map);
	}

	public void prcspackBomSSave1(List<PackBomS> list, String sysEmpNo, String compId) {
		for (PackBomS packBomS : list) {
			packBomS.setCompId(compId);
			packBomS.setSysEmpNo(sysEmpNo);
			dao.prcspackBomSSave1(packBomS);
		}
	}

	public void prcspackBomSSave2(List<PackBomS> list, String sysEmpNo, String compId) {
		for (PackBomS packBomS : list) {
			packBomS.setCompId(compId);
			packBomS.setSysEmpNo(sysEmpNo);
			dao.prcspackBomSSave2(packBomS);
		}
	}

}
