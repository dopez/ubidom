package com.ubi.erp.prod1.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.prod1.dao.OrderSDao;
import com.ubi.erp.prod1.domain.OrderS;

@Service
public class OrderSService {
	
	private OrderSDao dao;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(OrderSDao.class);
	}

	public void selEquiOrderS(Map<String, Object> map) {
		dao.selEquiOrderS(map);
	}

	public void prcsEquiOrderS(List<OrderS> list,String sysEmpNo, String compId,String setDate) {
		for(OrderS orderS : list) {
			orderS.setCompId(compId);
			orderS.setSysEmpNo(sysEmpNo);
			orderS.setSetDate(setDate);
			dao.prcsEquiOrderS(orderS);
		}
	}
}
