package com.ubi.erp.pers.dao;

import java.util.List;
import java.util.Map;

import com.ubi.erp.pers.domain.PersAppointS;

public interface PersAppointSDao {

	void selPersAppointSL(Map<String, Object> param);

	void selPersAppointSR(Map<String, Object> param);

	void prcsPersAppointS(PersAppointS persAppointS);

	List<PersAppointS> selPersBaseCode(PersAppointS persAppointS);
}
