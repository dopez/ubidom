package com.ubi.erp.acnt.dao;

import java.util.Map;

import com.ubi.erp.acnt.domain.AccCodeS;
import com.ubi.erp.sale.domain.CustCompS;

public interface AccCodeSDao {

    void getSrh(Map<String, Object> param);

    void prcsSave(AccCodeS accCodeS);
}
