package com.ubi.erp.rndt.dao;

import java.util.Map;

import com.ubi.erp.rndt.domain.MatrCodeS;

public interface MatrCodeSDao {

	void prcsMatrCodeS(MatrCodeS matrCodeS);

	void selGridMain(Map<String, Object> map);

	void selFormMain(Map<String, Object> map);

}
