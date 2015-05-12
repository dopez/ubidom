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
	@RequestMapping(value = "/getBaseCodeMstSel", method = RequestMethod.GET)
	public List<BaseCodeS> baseCodeMstSel(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		System.out.println(compId);
/*		map.put("V_COMP", "100");
		map.put("V_CODE", "%");
		map.put("V_NAME", "%");
*/		
		map.put("compId", compId);
		map.put("code", "%");
		map.put("codeName", "%");
		map.put("P_RST",null);
		baseCodeSService.selBaseCode(map);
		List<BaseCodeS> codeList = (List<BaseCodeS>) map.get("P_RST");
		//return (List<Rndt>) map.get("P_RST");
		return codeList;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/baseCodeMstSel", method = RequestMethod.POST)
	public List<BaseCodeS> prsSelDept(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String codeName="";
		if(request.getParameter("codeName").equals("") ||  request.getParameter("codeName") == null){
			codeName = "%";
		}else{
			codeName = request.getParameter("codeName");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("compId", compId);
		map.put("code", "%");
		map.put("codeName", codeName);
		map.put("P_RST", null);
		baseCodeSService.selBaseCode(map);
		List<BaseCodeS> list  = (List<BaseCodeS>) map.get("P_RST");
		return list;
	}	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/baseCodeDtlSel", method = RequestMethod.POST)
	public List<BaseCodeS> baseCodeDtlSel(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String code = request.getParameter("code");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("compId", compId);
		map.put("code", code);
		map.put("P_RST", null);
		baseCodeSService.selInterCode(map);
		List<BaseCodeS> innerCodeList = (List<BaseCodeS>) map.get("P_RST");
		for(int i=0;i<innerCodeList.size();i++){
			System.out.println(innerCodeList.get(i).getInnerCode());
		}
		return innerCodeList;
	}
	@RequestMapping(value = "/codeSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void codeSave(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<BaseCodeS> list = new ArrayList<BaseCodeS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<BaseCodeS>>(){});

		for (BaseCodeS basecodss : list) {
			System.out.println(basecodss.getCode());
			basecodss.setCode(basecodss.getCode());
			basecodss.setSysEmpNo(sysEmpNo);
			basecodss.setCompId(compId);
			baseCodeSService.crudRndt(basecodss);
		}
	}
	@RequestMapping(value = "/codeSaveDtl", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void codeSaveDtl(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
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
			basecodss.setCompId(compId);
			basecodss.setSysEmpNo(sysEmpNo);
			baseCodeSService.crudDtlRndt(basecodss);
		}
	}
	
}