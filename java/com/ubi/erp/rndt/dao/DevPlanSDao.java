package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.DevPlanS;

@Repository
public interface DevPlanSDao {
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
	void prcsFrmMainSave(DevPlanS devPlanS);

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
	void prcsFrmTab1Save(DevPlanS devPlanS);

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
	void prcsFrmTab2Save(DevPlanS devPlanS);

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
	void prcsGridTab3(DevPlanS devPlanS);

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
	void prcsGridTab4(DevPlanS devPlanS);

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
	void prcsFrmTab5Save(DevPlanS devPlanS);

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
	void prcsGridTab7(DevPlanS devPlanS);

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
	void prcsGridTab8(DevPlanS devPlanS);

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
	void prcsFrmTab6Save(DevPlanS devPlanS);

	void selFrmTab1(Map<String, Object> map);

	void selFrmTab2(Map<String, Object> map);

	void selFrmTab5(Map<String, Object> map);
	void selFrmTab6(Map<String, Object> map);

	void selGridTab3(Map<String, Object> map);
	void selGridTab4(Map<String, Object> map);
	void selGridTab7(Map<String, Object> map);
	void selGridTab8(Map<String, Object> map);
}