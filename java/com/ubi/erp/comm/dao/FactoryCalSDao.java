package com.ubi.erp.comm.dao;

import java.util.Map;

import com.ubi.erp.comm.domain.FactoryCalS;

public interface FactoryCalSDao {

	void selFactoryCalS(Map<String, Object> map);

	void initFactoryCalendar(Map<String, Object> map);

	void saveFactoryCalS(FactoryCalS factoryCalS);
}
