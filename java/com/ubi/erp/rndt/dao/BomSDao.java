package com.ubi.erp.rndt.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.rndt.domain.BomS;
@Repository
public interface BomSDao {
	void selGridItem(Map<String, Object> map);

	void selGridMst(Map<String, Object> map);

	void prcsFrmMainSave(BomS bomS);

	void selFrmMain(Map<String, Object> map);

	void selGridDtl(Map<String, Object> map);

	void selMatrCodePop(Map<String, Object> map);

	void prcsGridDtl(BomS bomS);

	void prcsBomCopy(BomS bomS);

}
