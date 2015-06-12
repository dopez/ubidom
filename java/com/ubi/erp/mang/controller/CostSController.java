package com.ubi.erp.mang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
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

import com.ubi.erp.mang.domain.CostS;
import com.ubi.erp.mang.service.CostSService;

@RestController
@RequestMapping(value = "/erp/mang/stan/costS")
public class CostSController {
 	private static final Logger logger = LoggerFactory.getLogger(CostSController.class);

	@Autowired
	private CostSService costSService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/searchA",method = RequestMethod.POST)
	public List<CostS> getSrhA(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String itemDiv = request.getParameter("itemDiv");
		String ioChk = request.getParameter("ioChk");
		String itemName = request.getParameter("itemName");
		map.put("V_COMPID", compId);
		map.put("V_ITEM_DIV",itemDiv);
		map.put("V_IO_CHK", ioChk);
		map.put("V_ITEM_NAME",itemName);
		map.put("o_cursor",null);
		logger.debug("V_COMPID is "+compId);
		logger.debug("V_ITEM_DIV is "+itemDiv);
		logger.debug("V_IO_CHK is "+ioChk);
		logger.debug("V_ITEM_NAME is "+itemName);
		costSService.getSrhA(map);
		logger.debug("searchA resultset is "+(List<CostS>)  map.get("o_cursor"));
		return (List<CostS>) map.get("o_cursor");

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/searchB",method = RequestMethod.POST)
	public List<CostS> getSrhB(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String itemDiv = request.getParameter("itemDiv");
		String ioChk = request.getParameter("ioChk");
		String itemCode = request.getParameter("itemCode");
		logger.debug("V_COMPID is "+compId);
		logger.debug("V_ITEM_DIV is "+itemDiv);
		logger.debug("V_IO_CHK is "+ioChk);
		logger.debug("V_ITEM_CODE is "+itemCode);
		map.put("V_COMPID", compId);
		map.put("V_ITEM_DIV", itemDiv);
		map.put("V_IO_CHK", ioChk);
		map.put("V_ITEM_CODE", itemCode);
		map.put("o_cursor", null);

		costSService.getSrhB(map);
		logger.debug("searchB resultset is "+(List<CostS>)  map.get("o_cursor"));
		return (List<CostS>)  map.get("o_cursor");

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/searchC",method = RequestMethod.POST)
	public List<CostS> getSrhC(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String itemDiv = request.getParameter("itemDiv");
		String ioChk = request.getParameter("ioChk");
		String itemCode = request.getParameter("itemCode");
		String custCode = request.getParameter("custCode");
		String mnyEa = request.getParameter("mnyEa");

		map.put("V_COMPID", compId);
		map.put("V_ITEM_DIV", itemDiv);
		map.put("V_IO_CHK", ioChk);
		map.put("V_ITEM_CODE", itemCode);
		map.put("V_CUST_CODE", custCode);
		map.put("V_MNY_EA", mnyEa);
		map.put("o_cursor", null);

		costSService.getSrhC(map);

		return (List<CostS>)  map.get("o_cursor");

	}

	@RequestMapping(value = "/saveB", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsSaveB(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {

			String compId = (String) session.getAttribute("compId");
		    String sysEmpNo = (String) session.getAttribute("empNo");

		    String jsonData = request.getParameter("jsonData");
		    logger.debug("saveB resultset is "+jsonData);
			List<CostS> list = new ArrayList<CostS>();

			ObjectMapper mapper = new ObjectMapper();

			list = mapper.readValue(jsonData, new TypeReference<ArrayList<CostS>>(){});

			for (CostS costS : list) {
				costS.setSysEmpNo(sysEmpNo);
				costS.setCompId(compId);
				costSService.prcsSaveB(costS);
			}

	}
}
