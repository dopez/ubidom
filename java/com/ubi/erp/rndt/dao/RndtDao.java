package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;
import com.ubi.erp.rndt.domain.Rndt;

@Repository
public interface RndtDao {
	void selBaseCode(Map<String, Object> param);

	void crudRndt(Rndt rndt);

	void crudDtlRndt(Rndt rndt);
}
