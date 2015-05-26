package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.LicenseDataS;

public interface LicenseDataSDao {

	void selLicenseDataSR(Map<String, Object> param);

	void prcsLicenseDataS(LicenseDataS licenseDataS);
}
