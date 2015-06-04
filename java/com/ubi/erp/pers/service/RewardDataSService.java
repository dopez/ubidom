package com.ubi.erp.pers.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubi.erp.pers.dao.RewardDataSDao;
import com.ubi.erp.pers.domain.RewardDataS;

@Service
public class RewardDataSService {

	private RewardDataSDao dao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		dao = sqlSession.getMapper(RewardDataSDao.class);
	}

	public void selRewardDataSR(Map<String, Object> map) {
		dao.selRewardDataSR(map);
	}

	public void prcsRewardDataS(List<RewardDataS> list,String sysEmpNo) {
		for(RewardDataS rewardDataS : list) {
			rewardDataS.setSysEmpNo(sysEmpNo);
			dao.prcsRewardDataS(rewardDataS);
		}
		
	}
}
