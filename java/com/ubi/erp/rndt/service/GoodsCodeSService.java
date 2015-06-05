package com.ubi.erp.rndt.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.text.ParseException;

import com.ubi.erp.rndt.dao.GoodsCodeSDao;
import com.ubi.erp.rndt.domain.GoodsCodeS;
import com.ubi.erp.sale.domain.WorkLogS;

@Service
public class GoodsCodeSService {
	private GoodsCodeSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(GoodsCodeSDao.class);
	}

	public void selGridMain(Map<String, Object> map) {
		dao.selGridMain(map);
		
	}

	public void selFormMain(Map<String, Object> map) {
		dao.selFormMain(map);
		
	}

	public void prcsFrmSave(GoodsCodeS goodsCodeS) {
		dao.prcsFrmSave(goodsCodeS);
		
	}
}