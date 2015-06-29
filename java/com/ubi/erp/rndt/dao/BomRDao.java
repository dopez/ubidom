package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface BomRDao {

	void selItemCodePop(Map<String, Object> map);

	void selGridMain(Map<String, Object> map);

	void selItemAllCodePop(Map<String, Object> map);

}
