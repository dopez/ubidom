package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface ImpReqRDao {

	void selGridMain(Map<String, Object> map);

}