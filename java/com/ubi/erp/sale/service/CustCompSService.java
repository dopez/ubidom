package com.ubi.erp.sale.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.sale.dao.CustCompSDao;
import com.ubi.erp.sale.domain.CustCompS;


@Service
public class CustCompSService {

    private CustCompSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(CustCompSDao.class);
	}
	public void getMasterSearch(Map<String, Object> map) {
		dao.getMasterSearch(map);

	}
	public void getDetailSearch(Map<String, Object> map) {
		dao.getDetailSearch(map);

	}
	public void getChkValidSave(Map<String, Object> map) {
		dao.getChkValidSave(map);

	}
	public void prcsMasterSave(CustCompS custCompS) {
		dao.prcsMasterSave(custCompS);

	}
	public void prcsDetailSave(CustCompS custCompS) {
		dao.prcsDetailSave(custCompS);

	}
}
