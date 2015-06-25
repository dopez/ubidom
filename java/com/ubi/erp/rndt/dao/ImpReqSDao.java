package com.ubi.erp.rndt.dao;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.ImpReqS;

@Repository
public interface ImpReqSDao {

	void prcsGridMain(ImpReqS impReqS);

}