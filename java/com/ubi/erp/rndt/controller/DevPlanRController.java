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

import com.ubi.erp.rndt.domain.DevPlanR;
import com.ubi.erp.rndt.service.DevPlanRService;



@RestController
@RequestMapping(value = "/erp/rndt/good/devPlanR")
public class DevPlanRController {

	
	@Autowired
	private DevPlanRService DevPlanRService;
	private static final Logger logger = LoggerFactory.getLogger(DevPlanRController.class);
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selGridMain", method = RequestMethod.POST)
	public List<DevPlanR> selGridMain(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevPlanR DevPlanR) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String stDate = request.getParameter("stDate");
		String edDate = request.getParameter("edDate");
		String writerEmp = request.getParameter("writerEmp");
		String ppsEmp = request.getParameter("ppsEmp");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("V_ST_DATE", stDate);
		map.put("V_ED_DATE", edDate);
		map.put("V_WRITER_EMP", writerEmp);
		map.put("V_PPS_EMP", ppsEmp);
		map.put("o_cursor", null);
		DevPlanRService.selGridMain(map);
		List<DevPlanR> list = (List<DevPlanR>) map.get("o_cursor");
		return list;
	}
}