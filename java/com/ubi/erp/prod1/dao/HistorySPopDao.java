package com.ubi.erp.prod1.dao;

import java.util.Map;

import com.ubi.erp.prod1.domain.HistorySPop;

public interface HistorySPopDao {

	void selEquiCheck(Map<String, Object> param);

	void prcsEquiCheck(HistorySPop historySPop);

	void selPartCodeHistory(Map<String, Object> param);

	void prcsPartCodeHistory(HistorySPop historySPop);
	
	void selPartCode(Map<String, Object> param);

}
