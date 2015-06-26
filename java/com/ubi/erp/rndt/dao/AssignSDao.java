package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.ImpReqS;

@Repository
public interface AssignSDao {

	void prcsGridMain(ImpReqS impReqS);

	void selGridMain(Map<String, Object> map);

	void selGridMst(Map<String, Object> map);

}