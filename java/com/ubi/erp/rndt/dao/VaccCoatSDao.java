package com.ubi.erp.rndt.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.VaccCoatS;

@Repository
public interface VaccCoatSDao {
	List<VaccCoatS> selGridMst();

	void selGridDtl(Map<String, Object> map);

	void selPopMain(Map<String, Object> map);

	void prcsGridDtl(VaccCoatS vaccCoatS);
}
