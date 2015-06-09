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

import com.ubi.erp.rndt.domain.BomR;
import com.ubi.erp.rndt.domain.BomR;
import com.ubi.erp.rndt.service.BomRService;



@RestController
@RequestMapping(value="/erp/rndt/stan/bomR")
public class BomRController {

	
	@Autowired
	private BomRService BomRService;
	private static final Logger logger = LoggerFactory.getLogger(BomRController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/itemCodePop", method = RequestMethod.POST)
	public List<BomR> selMatrCodePop(HttpServletRequest request, HttpServletResponse response,HttpSession session, BomR BomR) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String itemName = request.getParameter("itemName");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_ITEM_NAME", itemName);
		map.put("o_cursor", null);
		BomRService.selItemCodePop(map);
		List<BomR> list  = (List<BomR>) map.get("o_cursor");
		return list;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selGridMain", method = RequestMethod.POST)
	public List<BomR> selGridMain(HttpServletRequest request, HttpServletResponse response,HttpSession session, BomR BomR) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String itemCode = request.getParameter("itemCode");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("V_ITEM_CODE", itemCode);
		map.put("o_cursor", null);
		BomRService.selGridMain(map);
		List<BomR> list  = (List<BomR>) map.get("o_cursor");
		return list;
	}
}