package com.ubi.erp.sale.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface WorkLogSDao {
	void gridMainSel(Map<String, Object> map);
}
