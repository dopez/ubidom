package com.ubi.erp.comm.controller;

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

import com.ubi.erp.comm.domain.InterCodeR;
import com.ubi.erp.comm.service.InterCodeRService;

@RestController
@RequestMapping(value = "/erp/cmm/InterCodeR")
public class InterCodeRController {
	@Autowired
	private InterCodeRService interCodeRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.POST)
	public List<InterCodeR> selInterCode(HttpServletRequest request,HttpServletResponse response, HttpSession session, InterCodeR interCodeR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String comp = (String) session.getAttribute("compId");
		String code = request.getParameter("code");
		map.put("V_COMP", comp);
		map.put("V_CODE", code);
		map.put("P_RST", null);
		interCodeRService.selInterCode(map);
		List<InterCodeR> interCodelist = (List<InterCodeR>) map.get("P_RST");
		return interCodelist;
	}
}
