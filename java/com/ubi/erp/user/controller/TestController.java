package com.ubi.erp.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.user.domain.Test;
import com.ubi.erp.user.service.TestService;

@RestController
@RequestMapping(value = "/erp/gTest")
public class TestController {

	@Autowired
    private TestService testService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public List<Test> selTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("P_NAME", "%");
		map.put("P_RST",null);
		testService.selTest(map);
		return (List<Test>) map.get("P_RST");
	}

}
