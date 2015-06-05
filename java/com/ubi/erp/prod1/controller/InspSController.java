package com.ubi.erp.prod1.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.prod1.domain.InspS;
import com.ubi.erp.prod1.service.InspSService;

@RestController
@RequestMapping(value = "/erp/prod1/equi/inspS")
public class InspSController {
	
	@Autowired
	private InspSService inspSSservice;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch",method = RequestMethod.POST)
	public List<InspS> selEquiInspSL(HttpServletRequest request, HttpServletResponse response,HttpSession session,InspS inspS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String equiCode = request.getParameter("eqCode");
		String pfDate = inspS.getPfDate();
		String ptDate = inspS.getPtDate();
		map.put("compId", compId);
		map.put("equiCode", equiCode);
		map.put("pfDate", pfDate);
		map.put("ptDate", ptDate);
		map.put("o_cursor", null);
		inspSSservice.selEquiInspSL(map);
		List<InspS> list = (List<InspS>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<InspS> selEquiInspSR(HttpServletRequest request, HttpServletResponse response,HttpSession session,InspS inspS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String equiCode = request.getParameter("eqCode");
		String checkDate = inspS.getCheckDate();
		map.put("compId", compId);
		map.put("equiCode", equiCode);
		map.put("checkDate", checkDate);
		map.put("o_cursor", null);
		inspSSservice.selEquiInspSR(map);
		List<InspS> list = (List<InspS>) map.get("o_cursor");
		return list;
	}


	
	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsPartCodeHistory(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String compId = (String) session.getAttribute("compId");
		String jsonData = request.getParameter("jsonData");
		List<InspS> list = new ArrayList<InspS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<InspS>>(){});
		inspSSservice.prcsEquiInspS(list, sysEmpNo, compId);
	}
}
