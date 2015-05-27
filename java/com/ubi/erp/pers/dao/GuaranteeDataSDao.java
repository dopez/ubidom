package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.GuaranteeDataS;

public interface GuaranteeDataSDao {

	void selGuaranteeDataSR1(Map<String, Object> param);

	void prcsGuaranteeDataS1(GuaranteeDataS guaranteeDataS);

	void selGuaranteeDataSR2(Map<String, Object> param);

	void prcsGuaranteeDataS2(GuaranteeDataS guaranteeDataS);
}
