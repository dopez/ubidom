package com.ubi.erp.prod1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.prod1.domain.ComponentCodeS;
import com.ubi.erp.prod1.service.ComponentCodeSService;

@RestController
@RequestMapping(value = "/erp/prod1/equi/componentCodeS")
public class ComponentCodeSController {
	
	@Autowired
	private ComponentCodeSService componentCodeSSservice;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch",method = RequestMethod.POST)
	public List<ComponentCodeS> selEquiHistorySL(HttpServletRequest request, HttpServletResponse response,HttpSession session,ComponentCodeS componentCodeS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String partCode = request.getParameter("ptCode");
		String partName = request.getParameter("ptName");
		map.put("partCode", partCode);
		map.put("partName", partName);
		map.put("o_cursor", null);
		componentCodeSSservice.selComponentCodeSL(map);
		List<ComponentCodeS> list = (List<ComponentCodeS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridFormSearch",method = RequestMethod.POST)
	public List<ComponentCodeS> selEquiHistorySR(HttpServletRequest request, HttpServletResponse response,ComponentCodeS componentCodeS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String partCode = componentCodeS.getPartCode();
		map.put("partCode", partCode);
		map.put("o_cursor", null);
		componentCodeSSservice.selComponentCodeSR(map);
		List<ComponentCodeS> list = (List<ComponentCodeS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/gridFormSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsEquiHistoryS(HttpServletRequest request, HttpServletResponse response,HttpSession session,ComponentCodeS componentCodeS) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		componentCodeS.setSysEmpNo(sysEmpNo);
		componentCodeSSservice.prcsComponentCodeS(componentCodeS);
	}
	

}