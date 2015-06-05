package com.ubi.erp.rndt.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.GoodsCodeS;
@Repository
public interface GoodsCodeSDao {
	void selGridMain(Map<String, Object> map);

	void selFormMain(Map<String, Object> map);

	void prcsFrmSave(GoodsCodeS goodsCodeS);
}
