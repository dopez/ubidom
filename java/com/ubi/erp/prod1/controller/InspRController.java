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

import com.ubi.erp.prod1.domain.InspR;
import com.ubi.erp.prod1.service.InspRService;

@RestController
@RequestMapping(value = "/erp/prod1/equi/inspR")
public class InspRController {
	
	@Autowired
	private InspRService inspRSservice;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<InspR> selEquiInspSL(HttpServletRequest request, HttpServletResponse response,HttpSession session,InspR inspR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String equiCode = inspR.getEquiCode();
		String pfDate = inspR.getPfDate();
		String ptDate = inspR.getPtDate();
		String resultGbn = inspR.getResultGbn();
		map.put("compId", compId);
		map.put("equiCode", equiCode);
		map.put("pfDate", pfDate);
		map.put("ptDate", ptDate);
		map.put("result", resultGbn);
		map.put("o_cursor", null);
		inspRSservice.selEquiInspR(map);
		List<InspR> list = (List<InspR>) map.get("o_cursor");
		return list;
	}

}
