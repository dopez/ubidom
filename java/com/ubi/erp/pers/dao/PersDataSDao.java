package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.PersDataS;

public interface PersDataSDao {

	void selPersDataSL(Map<String, Object> param);

	void selPersDataSR(Map<String, Object> param);

	void prcsPersDataS(PersDataS persDataS);

}
