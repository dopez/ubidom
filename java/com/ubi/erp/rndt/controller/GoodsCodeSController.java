package com.ubi.erp.rndt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;


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
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.rndt.domain.GoodsCodeS;
import com.ubi.erp.rndt.service.GoodsCodeSService;



@RestController
@RequestMapping(value="/erp/rndt/stan/goodsCodeS")
public class GoodsCodeSController {

	
	@Autowired
	private GoodsCodeSService GoodsCodeSService;
	private static final Logger logger = LoggerFactory.getLogger(GoodsCodeSController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSel", method = RequestMethod.POST)
	public List<GoodsCodeS> selGridMain(HttpServletRequest request, HttpServletResponse response,HttpSession session, GoodsCodeS GoodsCodeS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String pCode = GoodsCodeS.getpCode();
		String pName = GoodsCodeS.getpName();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_ITEM_CODE", pCode);
		map.put("V_ITEM_NAME", pName);
		map.put("o_cursor", null);
		GoodsCodeSService.selGridMain(map);
		List<GoodsCodeS> list  = (List<GoodsCodeS>) map.get("o_cursor");
		return list;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/formMain", method = RequestMethod.POST)
	public List<GoodsCodeS> selFormMain(HttpServletRequest request, HttpServletResponse response,HttpSession session, GoodsCodeS GoodsCodeS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String itemCode = request.getParameter("itemCode");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_ITEM_CODE", itemCode);
		map.put("o_cursor", null);
		GoodsCodeSService.selFormMain(map);
		List<GoodsCodeS> list  = (List<GoodsCodeS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/frmSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFrmSave(HttpServletRequest request, HttpServletResponse response,HttpSession session, GoodsCodeS GoodsCodeS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");		
		
		GoodsCodeS.setSysEmpNo(sysEmpNo);
		GoodsCodeS.setCompId(compId);
		
		
		GoodsCodeSService.prcsFrmSave(GoodsCodeS);
	}
	
	
}