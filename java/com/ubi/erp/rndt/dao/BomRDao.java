package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.BomS;
@Repository
public interface BomRDao {
	void selItemCodePop(Map<String, Object> map);

	void selGridMain(Map<String, Object> map);

}
