package com.ubi.erp.rndt.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.DevRsltSDao;
import com.ubi.erp.rndt.domain.DevRsltS;

@Service
public class DevRsltSService {
	private DevRsltSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DevRsltSDao.class);
	}

	public void selPlanNumb01(Map<String, Object> map) {
		dao.selPlanNumb01(map);
	}

	public void selPlanNumb02(Map<String, Object> map) {
		dao.selPlanNumb02(map);
	}

	public void prcsFrmMainSave(DevRsltS devRsltS) {
		dao.prcsFrmMainSave(devRsltS);
	}

	public void selFrmMain(Map<String, Object> map) {
		dao.selFrmMain(map);
	}

	public void prcsFrmTabSave(DevRsltS devRsltS) {
		dao.prcsFrmTabSave(devRsltS);
	}

	public void prcsFrmTab4Save(DevRsltS devRsltS) {
		dao.prcsFrmTab4Save(devRsltS);
	}

	public void selFrmTabContents(Map<String, Object> map) {
		dao.selFrmTabContents(map);
	}

	public void selInitTab4(Map<String, Object> map) {
		dao.selInitTab4(map);
	}

	public void prcsFrmTab5Save(DevRsltS devRsltS) {
		dao.prcsFrmTab5Save(devRsltS);
	}

	public void selFrmTab4(Map<String, Object> map) {
		dao.selFrmTab4(map);
	}

	public void selFrmTab5(Map<String, Object> map) {
		dao.selFrmTab5(map);
	}

	public void selGridTab6(Map<String, Object> map) {
		dao.selGridTab6(map);
	}

	/**
	 * 1.개요 :
	 * 
	 * 2.파라미터 :
	 * 
	 * 3.리턴값 : void
	 * 
	 * @name_ko
	 * @param
	 */
	public void prcsGridTab6(List<DevRsltS> list, String sysEmpNo, String compId) {
		for (DevRsltS DevRsltS : list) {
			DevRsltS.setSysEmpNo(sysEmpNo);
			DevRsltS.setCompId(compId);
			dao.prcsGridTab6(DevRsltS);
		}
	}
}