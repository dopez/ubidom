package com.ubi.erp.pers.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.PersDataSDao;
import com.ubi.erp.pers.domain.PersDataS;

@Service
public class PersDataSService {

	private PersDataSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(PersDataSDao.class);
	}

	public void selPersDataSL(Map<String, Object> map) {
		dao.selPersDataSL(map);
	}

	public void selPersDataSR(Map<String, Object> map) {
		dao.selPersDataSR(map);
	}

	public void prcsPersDataS(PersDataS persDataS) {
		dao.prcsPersDataS(persDataS);
	}
	
	public void updateImgPath(PersDataS persDataS){
		dao.updateImgPath(persDataS);
	}

}
