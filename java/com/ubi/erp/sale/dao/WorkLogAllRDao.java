package com.ubi.erp.sale.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.sale.domain.WorkLogAllR;

@Repository
public interface WorkLogAllRDao {
	void selGridMain(Map<String, Object> map);

	void selGridDtl(Map<String, Object> map);
}
