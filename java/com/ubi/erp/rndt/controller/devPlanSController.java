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

import com.ubi.erp.rndt.domain.DevPlanS;
import com.ubi.erp.rndt.service.DevPlanSService;



@RestController
@RequestMapping(value = "/erp/rndt/stan/DevPlanS")
public class devPlanSController {

	
	@Autowired
	private DevPlanSService DevPlanSService;
	private static final Logger logger = LoggerFactory.getLogger(devPlanSController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selFrmMain", method = RequestMethod.POST)
	public List<DevPlanS> selFrmMain(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevPlanS DevPlanS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);
		DevPlanSService.selFrmMain(map);
		List<DevPlanS> list = (List<DevPlanS>) map.get("o_cursor");
		return list;
	}
}