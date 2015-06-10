package com.ubi.erp.comm.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.comm.dao.FactoryCalSDao;
import com.ubi.erp.comm.domain.FactoryCalS;

@Service
public class FactoryCalSService {

	private FactoryCalSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(FactoryCalSDao.class);
	}

	public void selFactoryCalS(Map<String, Object> map) {
		dao.selFactoryCalS(map);

	}

	public void initFactoryCalendar(Map<String, Object> map) {
		dao.initFactoryCalendar(map);

	}

	public void saveFactoryCalS(List<FactoryCalS> list,String sysEmpNo,String compId,String yValue,String mValue,String weKnd) {
		for(FactoryCalS factoryCalS : list) {
			factoryCalS.setSysEmpNo(sysEmpNo);
			factoryCalS.setCompId(compId);
			factoryCalS.setYyyy(yValue);
			factoryCalS.setMm(mValue);
			factoryCalS.setWeekKnd(weKnd);
			
			dao.saveFactoryCalS(factoryCalS);
		}
		
		

	}

}
