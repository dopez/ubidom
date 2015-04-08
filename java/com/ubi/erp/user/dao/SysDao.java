package com.ubi.erp.user.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.user.domain.Sys;

@Repository
public interface SysDao
{
	//List<Sys> selSys();

	void selSys(Map<String, Object> param);

	void insSys(Sys sys);

	int updSys(Sys sys);

	int delSys(Sys sys);

	Sys getSys(String sysId);

}
