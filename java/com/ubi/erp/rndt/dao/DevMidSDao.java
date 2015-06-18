package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.DevMidS;

@Repository
public interface DevMidSDao {

	void selDevPlanPop(Map<String, Object> map);

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
	void prcsFrmMainSave(DevMidS devMidS);

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
	void selPlanNumbChk(Map<String, Object> map);

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
	void prcsGridTab1(DevMidS devMidS);

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
	void prcsFrmTabSave(DevMidS devMidS);

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
	void selFrmMain(Map<String, Object> map);

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
	void selGridTab1(Map<String, Object> map);

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
	void selFrmTab2(Map<String, Object> map);

	void selFrmTab3(Map<String, Object> map);

	void selFrmTab4(Map<String, Object> map);

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
	void prcsGridTab5(DevMidS devMidS);

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
	void prcsGridTab6(DevMidS devMidS);

}