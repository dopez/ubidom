package com.ubi.erp.pers.controller;

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

import com.ubi.erp.pers.domain.VariableBaseWageR;
import com.ubi.erp.pers.service.VariableBaseWageRService;

@RestController
@RequestMapping(value = "/erp/pers/wage/variableBaseWageR")
public class VariableBaseWageRController {
	
	@Autowired
	private VariableBaseWageRService variableBaseWageRService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch",method = RequestMethod.POST)
	public List<VariableBaseWageR> selVariableBaseWageRL(HttpServletRequest request, HttpServletResponse response,HttpSession session,VariableBaseWageR variableBaseWageR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String serveGbn = variableBaseWageR.getServeGbn();
		String jikgun = variableBaseWageR.getJikgun();
		String postCode = variableBaseWageR.getPostCode();
		String empNo = variableBaseWageR.getEmpNo();
		map.put("compId", compId);
		map.put("postCode", postCode);
		map.put("empNo",empNo);
		map.put("jikgun",jikgun);
		map.put("serveGbn",serveGbn);
		map.put("o_cursor", null);
		variableBaseWageRService.selVariableBaseWageRL(map);
		List<VariableBaseWageR> list = (List<VariableBaseWageR>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<VariableBaseWageR> selFixBaseWageRR(HttpServletRequest request, HttpServletResponse response,VariableBaseWageR variableBaseWageR,HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String empNo = variableBaseWageR.getEmpNo();
		String yymm = variableBaseWageR.getYymm();
		map.put("compId", compId);
		map.put("yymm", yymm);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		variableBaseWageRService.selVariableBaseWageRR(map);
		List<VariableBaseWageR> list = (List<VariableBaseWageR>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFamilyDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<VariableBaseWageR> list = new ArrayList<VariableBaseWageR>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<VariableBaseWageR>>(){});
		String yymm = request.getParameter("monthDate");
		System.out.println("monthDate :::::::"+yymm);
		for(VariableBaseWageR variableBaseWageR : list) {
			variableBaseWageR.setSysEmpNo(sysEmpNo);
			variableBaseWageR.setCompId(compId);
			variableBaseWageR.setYymm(yymm);
			variableBaseWageRService.prcsVariableBaseWageR(variableBaseWageR);
		}
	}
}
