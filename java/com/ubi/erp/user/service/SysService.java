package com.ubi.erp.user.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.user.dao.SysDao;
import com.ubi.erp.user.domain.Sys;


@Service
public class SysService
{
	private SysDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(SysDao.class);
	}

	/*
	public List<Sys> selSys() {
		return dao.selSys();
	}
	*/

	public void selSys(Map<String, Object> map) {
		dao.selSys(map);
	}

	public Sys getSys(String sys) {
		return dao.getSys(sys);
	}

	public Sys insSys(Sys sys) {
		dao.insSys(sys);
		return dao.getSys(sys.getSysCd());
	}

	public int updSys(Sys sys) {
		return dao.updSys(sys);
	}

	public int delSys(Sys sys) {
		return dao.delSys(sys);
	}

	public void prcsSys(List<Sys> list) {
		for (Sys sys : list) {
			if ("CREATE".equals(sys.getCudKey())) {
				dao.insSys(sys);
			} else if ("UPDATE".equals(sys.getCudKey())) {
				dao.updSys(sys);
			} else if ("DELETE".equals(sys.getCudKey())) {
				dao.delSys(sys);
			}
		}
	}
}