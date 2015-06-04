package com.ubi.erp.rndt.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.VaccCoatS;

@Repository
public interface VaccCoatRDao {
	List<VaccCoatS> selGridMst();
	void selGridMain(Map<String, Object> map);
}
