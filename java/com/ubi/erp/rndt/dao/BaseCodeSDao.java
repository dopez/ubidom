package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.BaseCodeS;

@Repository
public interface BaseCodeSDao {
	void selBaseCodeMst(Map<String, Object> param);

	void prcsCodeSave(BaseCodeS basecodss);

	void prcsCodeDtlSave(BaseCodeS basecodss);

	void selBaseCodeDtl(Map<String, Object> param);
}
