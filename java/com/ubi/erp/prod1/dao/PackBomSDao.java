package com.ubi.erp.prod1.dao;

import java.util.Map;

import com.ubi.erp.prod1.domain.PackBomS;

public interface PackBomSDao {

	void selPackBomSTree(Map<String, Object> param);

	void selPackBomDelChk(Map<String, Object> param);

	void selPackBomSSch1(Map<String, Object> param);

	void selPackBomSSch2(Map<String, Object> param);

	void selPackBomSSch3(Map<String, Object> param);

	void prcspackBomSSave1(PackBomS packBomS);

	void prcspackBomSSave2(PackBomS packBomS);
}
