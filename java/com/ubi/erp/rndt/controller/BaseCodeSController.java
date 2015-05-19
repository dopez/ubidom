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

import com.ubi.erp.rndt.domain.BaseCodeS;
import com.ubi.erp.rndt.service.BaseCodeSService;



@RestController
@RequestMapping(value="/erp/rndt/baseCodeS")
public class BaseCodeSController {

	
	@Autowired
	private BaseCodeSService baseCodeSService;
	private static final Logger logger = LoggerFactory.getLogger(BaseCodeSController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selBaseCodeMst", method = RequestMethod.POST)
	public List<BaseCodeS> selBaseCodeMst(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String codeName = request.getParameter("codeName");
		String code = request.getParameter("code");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comp", comp);
		map.put("code", code);
		map.put("codeName", codeName);
		map.put("P_RST", null);
		baseCodeSService.selBaseCodeMst(map);
		List<BaseCodeS> list  = (List<BaseCodeS>) map.get("P_RST");
		return list;
	}	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selBaseCodeDtl", method = RequestMethod.POST)
	public List<BaseCodeS> selBaseCodeDtl(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String code = request.getParameter("code");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comp", comp);
		map.put("code", code);
		map.put("P_RST", null);
		baseCodeSService.selBaseCodeDtl(map);
		List<BaseCodeS> innerCodeList = (List<BaseCodeS>) map.get("P_RST");
		return innerCodeList;
	}
	@RequestMapping(value = "/prcsCodeSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsCodeSave(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<BaseCodeS> list = new ArrayList<BaseCodeS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<BaseCodeS>>(){});

		for (BaseCodeS basecodss : list) {
			System.out.println(basecodss.getCode());
			basecodss.setCode(basecodss.getCode());
			basecodss.setSysEmpNo(sysEmpNo);
			basecodss.setComp(comp);
			baseCodeSService.prcsCodeSave(basecodss);
		}
	}
	@RequestMapping(value = "/prcsCodeDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsCodeDtlSave(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData2");
		String code = request.getParameter("gridMstCode");
		logger.debug("jsonData"+jsonData);
		logger.debug("sysEmpNo"+sysEmpNo);
		logger.debug("code"+code);
		List<BaseCodeS> list = new ArrayList<BaseCodeS>();
		ObjectMapper mapper = new ObjectMapper();	
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<BaseCodeS>>(){});
		
		for (BaseCodeS basecodss : list) {
			logger.debug("list"+list);
			basecodss.setCode(code);
			basecodss.setComp(comp);
			basecodss.setSysEmpNo(sysEmpNo);
			baseCodeSService.prcsCodeDtlSave(basecodss);
		}
	}
	
}