package com.ubi.erp.prod1.dao;

import java.util.Map;

import com.ubi.erp.prod1.domain.InspS;

public interface InspSDao {
	
	void selEquiInspSL(Map<String, Object> param);

	void selEquiInspSR(Map<String, Object> param);

	void prcsEquiInspS(InspS inspS);
}
