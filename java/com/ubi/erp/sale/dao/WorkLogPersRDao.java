package com.ubi.erp.sale.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.sale.domain.WorkLogS;

@Repository
public interface WorkLogPersRDao {
	void selGridMain(Map<String, Object> map);

	void selGridMainProd1(Map<String, Object> map);

	void selGridMainRndt(Map<String, Object> map);
}
