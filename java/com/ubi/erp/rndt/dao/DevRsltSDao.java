package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.DevRsltS;

@Repository
public interface DevRsltSDao {

	void selPlanNumb01(Map<String, Object> map);

	void selPlanNumb02(Map<String, Object> map);

	void prcsFrmMainSave(DevRsltS devRsltS);

	void selFrmMain(Map<String, Object> map);

	void prcsFrmTabSave(DevRsltS devRsltS);

	void prcsFrmTab4Save(DevRsltS devRsltS);

	void selFrmTabContents(Map<String, Object> map);

	void selInitTab4(Map<String, Object> map);

	void prcsFrmTab5Save(DevRsltS devRsltS);

	void selFrmTab4(Map<String, Object> map);

	void selFrmTab5(Map<String, Object> map);

	void selGridTab6(Map<String, Object> map);

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
	void prcsGridTab6(DevRsltS devRsltS);

}