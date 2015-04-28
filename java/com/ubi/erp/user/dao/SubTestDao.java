package com.ubi.erp.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ubi.erp.user.domain.SubTest;

@Repository
public interface SubTestDao {
    void prsSelTest(Map<String, Object> param);
    void prsInsTest(SubTest subTest);
    void prsUpdTest(SubTest subTest);
    void prsDelTest(SubTest subTest);
    
    
	int insTest(SubTest subTest);
	int updTest(SubTest subTest);
	int delTest(SubTest subTest);
	List<SubTest> selTest(SubTest subTest);
}
