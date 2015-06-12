package com.ubi.erp.sale.controller;

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

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.ubi.erp.sale.domain.CustCompS;
import com.ubi.erp.sale.service.CustCompSService;

@RestController
@RequestMapping(value = "/erp/sale/stan/custCompS")
@JsonInclude(Include.NON_NULL)
public class CustCompSController {
    private static final Logger logger = LoggerFactory.getLogger(CustCompSController.class);

	@Autowired
	private CustCompSService custCompSService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mst",method = RequestMethod.POST)
	public List<CustCompS> getMasterSearch(HttpServletRequest request,HttpServletResponse response, HttpSession session, CustCompS CustCompS) throws Exception {

	    Map<String, Object> map = new HashMap<String, Object>();
	    String compId = (String) session.getAttribute("compId");
	    String custCode = request.getParameter("custCode");
	    String custName = request.getParameter("custName");

		map.put("V_COMPID",compId);
		map.put("V_CUST_CODE",custCode);
		map.put("V_CUST_NAME",custName);
		map.put("o_cursor", null);

 		custCompSService.getMasterSearch(map);

		return  (List<CustCompS>) map.get("o_cursor");
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/dtl",method = RequestMethod.POST)
	public List<CustCompS> getDetailSearch(HttpServletRequest request,HttpServletResponse response, HttpSession session, CustCompS CustCompS) throws Exception {

	    Map<String, Object> map = new HashMap<String, Object>();
	    String custCode = request.getParameter("custCode");
	    String compId = (String) session.getAttribute("compId");

		map.put("V_COMPID",compId);
		map.put("V_CUST_CODE",custCode);
		map.put("o_cursor", null);

 		custCompSService.getDetailSearch(map);

		return (List<CustCompS>) map.get("o_cursor");
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/chkValid",method = RequestMethod.POST)
	public List<CustCompS> getChkValidSave(HttpServletRequest request,HttpServletResponse response, HttpSession session, CustCompS CustCompS) throws Exception {

	    Map<String, Object> map = new HashMap<String, Object>();
	    String compId = (String) session.getAttribute("compId");
	    String sysEmpNo = (String) session.getAttribute("empNo");
	    String cudKey = request.getParameter("cudKey");
	    String custKorName = request.getParameter("custKorName");
	    String regiNumb = request.getParameter("regiNumb");


		map.put("cudKey",cudKey);
		map.put("compId",compId);
		map.put("custKorName",custKorName);
		map.put("regiNumb",regiNumb);
		map.put("sysEmpNo",sysEmpNo);
		map.put("o_cursor", null);

 		custCompSService.getChkValidSave(map);

		return (List<CustCompS>) map.get("o_cursor");
	}

	@RequestMapping(value = "/mstSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsMasterSave(HttpServletRequest request, HttpServletResponse response,HttpSession session,CustCompS custCompS) throws Exception {

		String compId = (String) session.getAttribute("compId");
	    String sysEmpNo = (String) session.getAttribute("empNo");

	    custCompS.setSysEmpNo(sysEmpNo);
	    custCompS.setCompId(compId);

	    custCompSService.prcsMasterSave(custCompS);

	}

	@RequestMapping(value = "/dtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsDetailSave(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {

		String compId = (String) session.getAttribute("compId");
	    String sysEmpNo = (String) session.getAttribute("empNo");

	    String jsonData = request.getParameter("jsonData");

		List<CustCompS> list = new ArrayList<CustCompS>();

		ObjectMapper mapper = new ObjectMapper();

		list = mapper.readValue(jsonData, new TypeReference<ArrayList<CustCompS>>(){});

		for (CustCompS custCompS : list) {
			custCompS.setSysEmpNo(sysEmpNo);
			custCompS.setCompId(compId);
			custCompSService.prcsDetailSave(custCompS);
		}
	}
}
