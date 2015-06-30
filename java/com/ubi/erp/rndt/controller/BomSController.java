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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.rndt.domain.BomS;
import com.ubi.erp.rndt.service.BomSService;



@RestController
@RequestMapping(value="/erp/rndt/stan/bomS")
public class BomSController {

	
	@Autowired
	private BomSService BomSService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/matrCodePop", method = RequestMethod.POST)
	public List<BomS> selMatrCodePop(HttpServletRequest request, HttpServletResponse response,HttpSession session, BomS BomS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String matrName = request.getParameter("matrName");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_MATR_NAME", matrName);
		map.put("o_cursor", null);
		BomSService.selMatrCodePop(map);
		List<BomS> list  = (List<BomS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridItemSel", method = RequestMethod.POST)
	public List<BomS> selGridItem(HttpServletRequest request, HttpServletResponse response,HttpSession session, BomS BomS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String pCode = request.getParameter("pCode");
		String pName = request.getParameter("pName");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_ITEM_CODE", pCode);
		map.put("V_ITEM_NAME", pName);
		map.put("o_cursor", null);
		BomSService.selGridItem(map);
		List<BomS> list  = (List<BomS>) map.get("o_cursor");
		return list;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSel", method = RequestMethod.POST)
	public List<BomS> selGridMst(HttpServletRequest request, HttpServletResponse response,HttpSession session, BomS BomS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String pCode = request.getParameter("itemCode");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_ITEM_CODE", pCode);
		map.put("o_cursor", null);
		BomSService.selGridMst(map);
		List<BomS> list  = (List<BomS>) map.get("o_cursor");
		return list;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSel", method = RequestMethod.POST)
	public List<BomS> selGridDtl(HttpServletRequest request, HttpServletResponse response,HttpSession session, BomS BomS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String itemCode = request.getParameter("itemCode");
		String revNo = request.getParameter("revNo");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("V_ITEM_CODE", itemCode);
		map.put("V_REV_NO", revNo);
		map.put("o_cursor", null);
		BomSService.selGridDtl(map);
		List<BomS> list  = (List<BomS>) map.get("o_cursor");
		return list;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/frmMain", method = RequestMethod.POST)
	public List<BomS> selFrmMain(HttpServletRequest request, HttpServletResponse response,HttpSession session, BomS BomS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String itemCode = request.getParameter("itemCode");
		String revNo = request.getParameter("revNo");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("V_ITEM_CODE", itemCode);
		map.put("V_REV_NO", revNo);
		map.put("o_cursor", null);
		BomSService.selFrmMain(map);
		List<BomS> list  = (List<BomS>) map.get("o_cursor");
		return list;
	}
	@RequestMapping(value = "/prcsFrmMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFrmMainSave(HttpServletRequest request, HttpServletResponse response,HttpSession session, BomS BomS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");		
		
		BomS.setSysEmpNo(sysEmpNo);
		BomS.setCompId(compId);
		
		
		BomSService.prcsFrmMainSave(BomS);
	}
	@RequestMapping(value = "/prcsBomCopy", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsBomCopy(HttpServletRequest request, HttpServletResponse response,HttpSession session, BomS BomS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");		
		String itemCode = request.getParameter("itemCode");
		String revNo = request.getParameter("revNo");
		
		BomS.setSysEmpNo(sysEmpNo);
		BomS.setCompId(compId);
		BomS.setItemCode(itemCode);
		BomS.setRevNo(revNo);
		
		BomSService.prcsBomCopy(BomS);
	}
	@RequestMapping(value = "/prcsGridDtl", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsGridDtl(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		List<BomS> list = new ArrayList<BomS>();
		
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");		
		String jsonData = request.getParameter("jsonData");
		
		list = new ObjectMapper().readValue(jsonData, new TypeReference<ArrayList<BomS>>(){});		
		BomSService.prcsGridDtl(list, sysEmpNo, compId);
	}}