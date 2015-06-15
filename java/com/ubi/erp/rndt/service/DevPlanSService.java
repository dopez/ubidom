package com.ubi.erp.rndt.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.rndt.dao.DevPlanSDao;
import com.ubi.erp.rndt.domain.DevPlanS;

@Service
public class DevPlanSService {
	private DevPlanSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(DevPlanSDao.class);
	}

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
	public void prcsFrmMainSave(DevPlanS devPlanS) {
		dao.prcsFrmMainSave(devPlanS);
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
	public void prcsFrmTab1Save(DevPlanS devPlanS) {
		dao.prcsFrmTab1Save(devPlanS);
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
	public void prcsFrmTab2Save(DevPlanS devPlanS) {
		dao.prcsFrmTab2Save(devPlanS);

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
	public void prcsGridTab3(List<DevPlanS> list, String sysEmpNo, String compId) {
		for (DevPlanS devPlanS : list) {
			devPlanS.setSysEmpNo(sysEmpNo);
			devPlanS.setCompId(compId);
			dao.prcsGridTab3(devPlanS);
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
	public void prcsGridTab4(List<DevPlanS> list, String sysEmpNo, String compId) {
		for (DevPlanS devPlanS : list) {
			devPlanS.setSysEmpNo(sysEmpNo);
			devPlanS.setCompId(compId);
			dao.prcsGridTab4(devPlanS);
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
	public void prcsFrmTab5Save(DevPlanS devPlanS) {
		dao.prcsFrmTab5Save(devPlanS);
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
	public void prcsGridTab7(List<DevPlanS> list, String sysEmpNo, String compId) {
		for (DevPlanS devPlanS : list) {
			devPlanS.setSysEmpNo(sysEmpNo);
			devPlanS.setCompId(compId);
			dao.prcsGridTab7(devPlanS);
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
	public void prcsGridTab8(List<DevPlanS> list, String sysEmpNo, String compId) {
		for (DevPlanS devPlanS : list) {
			devPlanS.setSysEmpNo(sysEmpNo);
			devPlanS.setCompId(compId);
			dao.prcsGridTab8(devPlanS);
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
	public void prcsFrmTab6Save(DevPlanS devPlanS) {
		dao.prcsFrmTab6Save(devPlanS);
	}

	public void selFrmTab1(Map<String, Object> map) {
		dao.selFrmTab1(map);
		
	}

	public void selFrmTab2(Map<String, Object> map) {
		dao.selFrmTab2(map);
	}

	public void selFrmTab5(Map<String, Object> map) {
		dao.selFrmTab5(map);
	}

	public void selFrmTab6(Map<String, Object> map) {
		dao.selFrmTab6(map);
		
	}

	public void selGridTab3(Map<String, Object> map) {
		dao.selGridTab3(map);
		
	}
	public void selGridTab4(Map<String, Object> map) {
		dao.selGridTab4(map);
		
	}
	public void selGridTab7(Map<String, Object> map) {
		dao.selGridTab7(map);
		
	}
	public void selGridTab8(Map<String, Object> map) {
		dao.selGridTab8(map);
		
	}

}