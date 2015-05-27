package com.ubi.erp.sale.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.sale.domain.CustCompS;
@Repository
public interface CustCompSDao {

    void getMasterSearch(Map<String, Object> param);

    void getDetailSearch(Map<String, Object> param);

    void getChkValidSave(Map<String, Object> param);

    void prcsMasterSave(CustCompS custCompS);

    void prcsDetailSave(CustCompS custCompS);
}
