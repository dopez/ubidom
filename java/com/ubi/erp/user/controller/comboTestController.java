package com.ubi.erp.user.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.user.domain.comboTest;
import com.ubi.erp.user.service.comboTestService;

@RestController
@RequestMapping(value="/erp/comboTest")
public class comboTestController {

	@Autowired
	private comboTestService comboTestService;
	@RequestMapping(value="/selComp", method = RequestMethod.GET)
	public List<comboTest> selComp(HttpServletRequest request, HttpServletResponse response,comboTest comboTest) throws Exception {
		List<comboTest> list = comboTestService.selComp(comboTest);
		return list;
	}
	
}
