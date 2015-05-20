package com.ubi.erp.rndt.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.PersDataS;

public interface MatrCodeSDao {

	void selPersDataSL(Map<String, Object> param);

	void selPersDataSR(Map<String, Object> param);

	void prcsPersDataS(PersDataS persDataS);

}
