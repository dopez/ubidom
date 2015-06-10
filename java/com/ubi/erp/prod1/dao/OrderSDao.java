package com.ubi.erp.prod1.dao;

import java.util.Map;

import com.ubi.erp.prod1.domain.OrderS;

public interface OrderSDao {

	void selEquiOrderS(Map<String, Object> param);

	void prcsEquiOrderS(OrderS orderS);
}
