package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.BaseCodeS;

@Repository
public interface BaseCodeSDao {
	void selBaseCode(Map<String, Object> param);

	void crudRndt(BaseCodeS basecodss);

	void crudDtlRndt(BaseCodeS basecodss);

	void selInterCode(Map<String, Object> param);
}
