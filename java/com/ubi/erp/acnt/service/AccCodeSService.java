package com.ubi.erp.acnt.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.acnt.dao.AccCodeSDao;
import com.ubi.erp.acnt.domain.AccCodeS;


@Service
public class AccCodeSService {
	private AccCodeSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(AccCodeSDao.class);
	}
	public void getSrh(Map<String, Object> param) {
    	dao.getSrh(param);
    }

    public void prcsSave(AccCodeS accCodeS){
    	dao.prcsSave(accCodeS);
    }

}
