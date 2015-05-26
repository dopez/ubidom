package com.ubi.erp.pers.dao;

import java.util.Map;

import com.ubi.erp.pers.domain.RewardDataS;

public interface RewardDataSDao {

	void selRewardDataSR(Map<String, Object> param);

	void prcsRewardDataS(RewardDataS rewardDataS);
}
