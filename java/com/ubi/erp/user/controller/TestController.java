package com.ubi.erp.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.ubi.erp.cmm.util.gson.JsonUtil;
import com.ubi.erp.user.domain.Test;
import com.ubi.erp.user.service.TestService;

@Controller
@RequestMapping(value = "/erp/gridTest")
public class TestController {

	@Autowired
    private TestService testService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void selTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("P_NAME", "%");
		map.put("P_RST",null);
		testService.selTest(map);
		List<Test> list = (List<Test>) map.get("P_RST");

		StringBuffer sb = new StringBuffer("<?xml version='1.0'?><rows total_count='");
		sb.append(list.size()).append("' pos='0'>");
		int i = 1;
		for (Test test : list) {
			sb.append("<row id='").append(i).append("'>");
			sb.append("<cell></cell><cell></cell><cell>")
				.append(test.getRnum()).append("</cell><cell><![CDATA[")
				.append(test.getItemCode()).append("]]></cell><cell><![CDATA[")
				.append(test.getItemName()).append("]]></cell><cell><![CDATA[")
				.append(test.getItemSize()).append("]]></cell>");
			sb.append("</row>");
			i++;
		}
		sb.append("</rows>");
		String str = sb.toString();

		makeResponse(response, "plain", str);
	}
	
	@RequestMapping(value = "/prcs", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();

		try {
			String jsonData = request.getParameter("jsonData");
			List<Test> list = new ArrayList<Test>();
			ObjectMapper mapper = new ObjectMapper();
			list = mapper.readValue(jsonData, new TypeReference<ArrayList<Test>>() {
			});

			for (Test test : list) {
				if ("CREATE".equals(test.getCudKey())) {
					testService.insTest(test);
				} else if ("UPDATE".equals(test.getCudKey())) {
					testService.updTest(test);
				} else if ("DELETE".equals(test.getCudKey())) {
					testService.delTest(test);
				}
			}

			Map<String, String> map = new HashMap<String, String>();
			map.put("rtnCode", "1");
			String jsonStr = new String(JsonUtil.parseToString(map));
			makeResponse(response, "json", jsonStr);

		} catch (DuplicateKeyException e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR005"); // PK 중복
			//ht.put("EXCEPTION_MSG_PARAM", "");

		} finally {
			if (!ht.isEmpty()) {
				response.setHeader("EXCEPTION", "Y");
				makeResponse(response, "json", JsonUtil.parseToString(ht));
			}
		}
	}

	private void makeResponse(HttpServletResponse response, String resType, String str) throws IOException {
		response.setContentType("application/" + resType + ";");
		ServletOutputStream sos = response.getOutputStream();
		sos.print(new String(str.getBytes("UTF-8"), "8859_1"));
	}
}
