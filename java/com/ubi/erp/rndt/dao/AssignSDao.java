package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.AssignS;

@Repository
public interface AssignSDao {

	void selGridMst(Map<String, Object> map);

	void selGridDtl(Map<String, Object> map);

	void prcsGridDtl(AssignS assignS);

}