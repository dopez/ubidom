package com.ubi.erp.plan.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface PurcConferOrderRDao {
	
	void gridMainSel(Map<String, Object> map);
	
	void getSeqReturn(Map<String, Object> map);
}
