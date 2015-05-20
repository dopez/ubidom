package com.ubi.erp.rndt.dao;

import java.util.Map;

import com.ubi.erp.rndt.domain.MatrCodeS;

public interface MatrCodeSDao {

	void selPersDataSL(Map<String, Object> param);

	void selPersDataSR(Map<String, Object> param);

	void prcsPersDataS(MatrCodeS persDataS);

}
