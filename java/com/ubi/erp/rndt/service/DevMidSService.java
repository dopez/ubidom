package com.ubi.erp.rndt.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.DevMidSDao;
import com.ubi.erp.rndt.domain.DevMidS;

@Service
public class DevMidSService {
	private DevMidSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DevMidSDao.class);
	}

	public void selDevPlanPop(Map<String, Object> map) {
		dao.selDevPlanPop(map);
	}

	/**
	 * 1.개요 : 마스터 폼
	 * 
	 * 2.파라미터 :
	 * 
	 * 3.리턴값 : void
	 * 
	 * @name_ko
	 * @param
	 */
	public void prcsFrmMainSave(DevMidS devMidS) {
		dao.prcsFrmMainSave(devMidS);
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
	public void selPlanNumbChk(Map<String, Object> map) {
		dao.selPlanNumbChk(map);
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
	public void prcsGridTab(List<DevMidS> list, String sysEmpNo, String compId, String tabId) {
		for (DevMidS devMidS : list) {
			devMidS.setSysEmpNo(sysEmpNo);
			devMidS.setCompId(compId);
			if (tabId.equals("a1")) {
				dao.prcsGridTab1(devMidS);
			}
		}

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
	public void prcsFrmTabSave(DevMidS devMidS) {
		dao.prcsFrmTabSave(devMidS);
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
	public void selFrmMain(Map<String, Object> map) {
		dao.selFrmMain(map);
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
	public void selGridTab1(Map<String, Object> map) {
		dao.selGridTab1(map);
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
	public void selFrmTab2(Map<String, Object> map) {
		dao.selFrmTab2(map);
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
	public void selFrmTab3(Map<String, Object> map) {
		dao.selFrmTab3(map);
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
	public void selFrmTab4(Map<String, Object> map) {
		dao.selFrmTab4(map);
	}

}