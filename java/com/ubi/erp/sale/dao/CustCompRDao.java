package com.ubi.erp.sale.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface CustCompRDao {

	void getSearch(Map<String, Object> param);

}
