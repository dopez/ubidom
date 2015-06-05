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

import com.ubi.erp.rndt.domain.MatrCodeS;
import com.ubi.erp.rndt.domain.VaccCoatS;
import com.ubi.erp.rndt.service.VaccCoatSService;
import com.ubi.erp.sale.domain.WorkLogPersR;
import com.ubi.erp.sale.domain.WorkLogS;



@RestController
@RequestMapping(value="/erp/rndt/stan/vaccCoatS")
public class VaccCoatSController {

	
	@Autowired
	private VaccCoatSService vaccCoatSService;
	private static final Logger logger = LoggerFactory.getLogger(VaccCoatSController.class);

	@RequestMapping(value = "/gridMstSel", method = RequestMethod.POST)
	public List<VaccCoatS> selGridMst(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		List<VaccCoatS> list  = vaccCoatSService.selGridMst();
		return list;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSel", method = RequestMethod.POST)
	public List<VaccCoatS> selGridDtl(HttpServletRequest request, HttpServletResponse response,HttpSession session, VaccCoatS vaccCoatS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String equiCode = request.getParameter("equiCode");
		String applyDate = request.getParameter("applyDate");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("V_EQUI_CODE", equiCode);
		map.put("V_APPLY_DATE", applyDate);
		map.put("o_cursor", null);
		vaccCoatSService.selGridDtl(map);
		List<VaccCoatS> list  = (List<VaccCoatS>) map.get("o_cursor");
		return list;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/popMainSel",method = RequestMethod.POST)
	public List<VaccCoatS> selPopMain(HttpServletRequest request, HttpServletResponse response,HttpSession session,VaccCoatS vaccCoatS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String matrCode = request.getParameter("matrCode");
		String matrName = request.getParameter("matrName");
		String matrSpec = request.getParameter("matrSpec");
		String matrKind = request.getParameter("matrKind");
		map.put("V_COMPID", compId);
		map.put("V_MATR_CODE", matrCode);
		map.put("V_MATR_NAME", matrName);
		map.put("V_MATR_SPEC", matrSpec);
		map.put("V_MATR_KIND", matrKind);
		map.put("o_cursor", null);
		vaccCoatSService.selPopMain(map);
		List<VaccCoatS> matrCodelist = (List<VaccCoatS>) map.get("o_cursor");
		return matrCodelist;
	}
	@RequestMapping(value = "/prcsGridDtl", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsGridDtl(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		List<VaccCoatS> list = new ArrayList<VaccCoatS>();
		
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");		
		String jsonData = request.getParameter("jsonData");
		
		list = new ObjectMapper().readValue(jsonData, new TypeReference<ArrayList<VaccCoatS>>(){});		
		vaccCoatSService.prcsGridDtl(list, sysEmpNo, compId);
	}
	
	
}