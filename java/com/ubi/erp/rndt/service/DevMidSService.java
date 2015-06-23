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
			}else if (tabId.equals("a5")) {
				dao.prcsGridTab5(devMidS);
			} else if (tabId.equals("a6")) {
				dao.prcsGridTab6(devMidS);
			} else if (tabId.equals("a8")) {
				dao.prcsGridTab8(devMidS);
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
	public void selDevPlanPop02(Map<String, Object> map) {
		dao.selDevPlanPop02(map);
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
	public void selChangeCont(Map<String, Object> map) {
		dao.selChangeCont(map);
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
	public void selChangeCont2(Map<String, Object> map) {
		dao.selChangeCont2(map);
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
	public void selChangeCont3(Map<String, Object> map) {
		dao.selChangeCont3(map);
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
	public void selChangeCont4(Map<String, Object> map) {
		dao.selChangeCont4(map);
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
	public void selGridTab5(Map<String, Object> map) {
		dao.selGridTab5(map);
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
	public void selFrmTab7(Map<String, Object> map) {
		dao.selFrmTab7(map);
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
	public void selGridTab8(Map<String, Object> map) {
		dao.selGridTab8(map);
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
	public void prcsFrmTab7Save(DevMidS devMidS) {
		dao.prcsFrmTab7Save(devMidS);
	}

}