package com.ubi.erp.sale.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.sale.domain.WorkLogS;

@Repository
public interface WorkLogSDao {
	void gridMainSel(Map<String, Object> map);

	void getSeqReturn(Map<String, Object> map);

	void gridMainSave(WorkLogS workLogs);
}
