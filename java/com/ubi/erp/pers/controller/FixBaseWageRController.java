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

import com.ubi.erp.pers.domain.FixBaseWageR;
import com.ubi.erp.pers.service.FixBaseWageRService;

@RestController
@RequestMapping(value = "/erp/pers/wage/fixBaseWageR")
public class FixBaseWageRController {
	
	@Autowired
	private FixBaseWageRService fixBaseWageRService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch",method = RequestMethod.POST)
	public List<FixBaseWageR> selFixBaseWageRL(HttpServletRequest request, HttpServletResponse response,HttpSession session,FixBaseWageR fixBaseWageR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String serveGbn = fixBaseWageR.getServeGbn();
		String jikgun = fixBaseWageR.getJikgun();
		String postCode = fixBaseWageR.getPostCode();
		String empNo = fixBaseWageR.getEmpNo();
		map.put("compId", compId);
		map.put("postCode", postCode);
		map.put("empNo",empNo);
		map.put("jikgun",jikgun);
		map.put("serveGbn",serveGbn);
		map.put("o_cursor", null);
		fixBaseWageRService.selFixBaseWageRL(map);
		List<FixBaseWageR> list = (List<FixBaseWageR>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<FixBaseWageR> selFixBaseWageRR(HttpServletRequest request, HttpServletResponse response,FixBaseWageR fixBaseWageR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = fixBaseWageR.getCompId();
		String empNo = fixBaseWageR.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		fixBaseWageRService.selFixBaseWageRR(map);
		List<FixBaseWageR> list = (List<FixBaseWageR>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFamilyDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<FixBaseWageR> list = new ArrayList<FixBaseWageR>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<FixBaseWageR>>(){});
		fixBaseWageRService.prcsFixBaseWageR(list,compId,sysEmpNo);
	}
}
