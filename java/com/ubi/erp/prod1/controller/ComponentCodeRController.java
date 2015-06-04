package com.ubi.erp.prod1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.prod1.domain.ComponentCodeR;
import com.ubi.erp.prod1.service.ComponentCodeRService;

@RestController
@RequestMapping(value = "/erp/prod1/equi/componentCodeR")
public class ComponentCodeRController {
	
	@Autowired
	private ComponentCodeRService componentCodeRSservice;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<ComponentCodeR> selEquiHistorySL(HttpServletRequest request, HttpServletResponse response,HttpSession session,ComponentCodeR componentCodeR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String partCode = componentCodeR.getPartCode();
		map.put("partCode", partCode);
		map.put("o_cursor", null);
		componentCodeRSservice.selComponentCodeR(map);
		List<ComponentCodeR> list = (List<ComponentCodeR>) map.get("o_cursor");
		return list;
	}
	
}
