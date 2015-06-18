package com.ubi.erp.rndt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.rndt.domain.DevMidR;
import com.ubi.erp.rndt.service.DevMidRService;



@RestController
@RequestMapping(value = "/erp/rndt/good/devMidR")
public class DevMidRController {
	@Autowired
	private DevMidRService DevMidRService;
	private static final Logger logger = LoggerFactory.getLogger(DevMidRController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selGridMain", method = RequestMethod.POST)
	public List<DevMidR> selGridMain(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevMidR DevMidR) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String stDate = request.getParameter("stDate");
		String edDate = request.getParameter("edDate");
		String empNo = request.getParameter("empNo");
		String ppsEmp = request.getParameter("ppsEmp");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comp", comp);
		map.put("stDate", stDate);
		map.put("edDate", edDate);
		map.put("empNo", empNo);
		map.put("ppsEmp", ppsEmp);

		map.put("o_cursor", null);
		DevMidRService.selGridMain(map);
		List<DevMidR> list = (List<DevMidR>) map.get("o_cursor");
		return list;
	}

}