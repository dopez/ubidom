package com.ubi.erp.prod1.dao;

import java.util.Map;

import com.ubi.erp.prod1.domain.HistoryS;

public interface HistorySDao {

	void selEquiHistorySL(Map<String, Object> param);

	void selEquiHistorySR(Map<String, Object> param);

	void prcsEquiHistoryS(HistoryS historyS);
}
