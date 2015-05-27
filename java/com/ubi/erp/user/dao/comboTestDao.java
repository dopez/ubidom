package com.ubi.erp.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ubi.erp.user.domain.comboTest;

@Repository
public interface comboTestDao {
	List<comboTest> selComp(comboTest comboTest);
}
