package com.ubi.erp.plan.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.plan.domain.PurcConferOrderS;

@Repository
public interface PurcConferOrderSDao {
	
	void topMainSel(Map<String, Object> map);
	
	void gridMainSel(Map<String, Object> map);
	
	void getSeqReturn(Map<String, Object> map);
	
	void gridMainSave(PurcConferOrderS orderS);
	
	void gridTopSave(PurcConferOrderS orderS);
}
