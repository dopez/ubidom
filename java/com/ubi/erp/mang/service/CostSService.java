package com.ubi.erp.mang.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.mang.dao.CostSDao;
import com.ubi.erp.mang.domain.CostS;

@Service
public class CostSService {
	private CostSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(CostSDao.class);
	}

	public void getSrhA(Map<String, Object> param) {
    	dao.getSrhA(param);
    }

	public void getSrhB(Map<String, Object> param) {
    	dao.getSrhB(param);
    }

	public void getSrhC(Map<String, Object> param) {
    	dao.getSrhC(param);
    }

    public void prcsSaveB(CostS costS){
    	dao.prcsSaveB(costS);
    }
}
