package com.ubi.erp.user.controller;

import java.util.ArrayList;
import java.util.List;

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

import com.ubi.erp.user.domain.SubTest;
import com.ubi.erp.user.service.SubTestService;

@RestController
@RequestMapping(value="/erp/subTest")
public class SubTestController {

	@Autowired
	private SubTestService subTestService;
	
	@RequestMapping(method = RequestMethod.GET)
	public List<SubTest> selTest(HttpServletRequest request, HttpServletResponse response,SubTest subTest) throws Exception {
		List<SubTest> list = subTestService.selTest(subTest);
		return list;
	}
	
	@RequestMapping(value = "/delTest", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void delTest(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String jsonData = request.getParameter("jsonData");
		List<SubTest> list = new ArrayList<SubTest>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<SubTest>>(){});
		
		for(SubTest subTest : list) {
			subTestService.delTest(subTest);
		}
		
	}
	
	/*@RequestMapping(value = "/grid_test", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String jsonData = request.getParameter("jsonData");
		List<Test> list = new ArrayList<Test>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<Test>>(){});
		
		for(Test test : list) {
			if("CREATE_VALUE".equals(test.getCudKey())) {
				testService.insTest(test);
			}else if("UPDATE_VALUE".equals(test.getCudKey())){
				testService.updTest(test);
			}else if("DELETE_VALUE".equals(test.getCudKey())){
				testService.delTest(test);
			}
		}
	}*/
}