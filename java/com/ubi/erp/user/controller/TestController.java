package com.ubi.erp.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.user.domain.Sys;
import com.ubi.erp.user.domain.Test;
import com.ubi.erp.user.service.TestService;

@RestController
@RequestMapping(value = "/erp/gTest/grid_test")
public class TestController {

	@Autowired
    private TestService testService;

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public List<Test> selTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("rst", null);
		testService.selTest(param);
		return (List<Test>) param.get("rst");
	}

	@RequestMapping(value = "/grid_test", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String jsonData = request.getParameter("jsonData");
		List<Test> list = new ArrayList<Test>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<Test>>(){});
		
		for(Test test : list) {
			if("CREATE_VALUE".equals(test.getCudKey())) {
				test.setCreator("C2000000");
				testService.insTest(test);
			} else if("UPDATE_VALUE".equals(test.getCudKey())) {
				test.setEditor("C2000000");
				testService.updTest(test);
			} else if ("DELETE_VALUE".equals(test.getCudKey())) {
				testService.delTest(test);
			}
		}
	}
}
