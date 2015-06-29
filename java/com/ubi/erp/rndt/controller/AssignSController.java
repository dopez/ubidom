package com.ubi.erp.rndt.controller;

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

import com.ubi.erp.rndt.domain.AssignS;
import com.ubi.erp.rndt.service.AssignSService;



@RestController
@RequestMapping(value = "/erp/rndt/good/assignS")
public class AssignSController {
	@Autowired
	private AssignSService AssignSService;
	private static final Logger logger = LoggerFactory.getLogger(AssignSController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selGridMst", method = RequestMethod.POST)
	public List<AssignS> selGridMst(HttpServletRequest request, HttpServletResponse response, HttpSession session, AssignS AssignS) throws Exception {
		String comp = (String) session.getAttribute("compId");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("o_cursor", null);
		AssignSService.selGridMst(map);
		List<AssignS> list = (List<AssignS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selGridDtl", method = RequestMethod.POST)
	public List<AssignS> selGridDtl(HttpServletRequest request, HttpServletResponse response, HttpSession session, AssignS AssignS) throws Exception {
		String comp = (String) session.getAttribute("compId");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("o_cursor", null);
		AssignSService.selGridDtl(map);
		List<AssignS> list = (List<AssignS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/prcsGridDtl", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsGridDtl(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		List<AssignS> list = new ArrayList<AssignS>();

		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");

		list = new ObjectMapper().readValue(jsonData, new TypeReference<ArrayList<AssignS>>() {
		});
		AssignSService.prcsGridDtl(list, sysEmpNo, compId);
	}
}