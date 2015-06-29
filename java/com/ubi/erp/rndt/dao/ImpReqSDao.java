package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.ImpReqS;

@Repository
public interface ImpReqSDao {

	void prcsGridMain(ImpReqS impReqS);

	void selGridMain(Map<String, Object> map);

}