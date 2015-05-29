package com.ubi.erp.sale.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.sale.domain.WorkLogS;
import com.ubi.erp.sale.service.WorkLogSService;



@RestController
@RequestMapping(value="erp/sale/wlog/workLogS")
public class WorkLogSController {

	
	@Autowired
	private WorkLogSService workLogSService;
	private static final Logger logger = LoggerFactory.getLogger(WorkLogSController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSel", method = RequestMethod.POST)
	public List<WorkLogS> gridMainSel(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String codeName = request.getParameter("codeName");
		String code = request.getParameter("code");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comp", comp);
		map.put("code", code);
		map.put("codeName", codeName);
		map.put("P_RST", null);
		workLogSService.gridMainSel(map);
		List<WorkLogS> list  = (List<WorkLogS>) map.get("P_RST");
		System.out.println();
		logger.debug("list"+list);
		System.out.println();
		return list;
	}	

	
}