package com.ubi.erp.pers.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.DeptSDao;
import com.ubi.erp.pers.domain.DeptS;

@Service
public class DeptSService {
	private DeptSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DeptSDao.class);
	}

	public void selDeptS(Map<String, Object> map) {
		dao.selDeptS(map);
	}

	public void prcsDeptS(List<DeptS> list,String sysEmpNo,String compId) {
		for(DeptS deptS : list) {
		deptS.setPostNameMst(deptS.getPostName());
		deptS.setSysEmpNo(sysEmpNo);
		deptS.setCompId(compId);
		dao.prcsDeptS(deptS);
		}
	}

	public void selDeptCodeS(Map<String, Object> map) {
		dao.selDeptCodeS(map);
	}

}
