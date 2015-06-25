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

}