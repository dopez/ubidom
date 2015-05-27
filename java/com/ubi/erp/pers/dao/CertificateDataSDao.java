package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.CertificateDataS;

public interface CertificateDataSDao {

	void selCertificateDataS(Map<String, Object> param);

	void prcsCertificateDataS(CertificateDataS certificateDataS);

	void CertificateDataP(Map<String, Object> param);
}
