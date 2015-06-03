package com.ubi.erp.sale.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.cmm.util.gson.DateFormatUtil;
import com.ubi.erp.sale.domain.WorkLogAllR;
import com.ubi.erp.sale.domain.WorkLogPersR;
import com.ubi.erp.sale.domain.WorkLogS;
import com.ubi.erp.sale.service.WorkLogAllRService;



@RestController
@RequestMapping(value="/erp/sale/wlog/workLogAllR")
public class WorkLogAllRController {

	
	@Autowired
	private WorkLogAllRService workLogAllRService;
	private static final Logger logger = LoggerFactory.getLogger(WorkLogAllRController.class);
	
	
	public ModelAndView getSession(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException{
		String empNo = (String) session.getAttribute("empNo");
		String empName = (String) session.getAttribute("empName");
		ModelAndView mnv = new ModelAndView("/erp/sale/wlog/workLogAllR");
		mnv.addObject("empNo", empNo);
		mnv.addObject("empName", empName);
		return mnv;
		
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSel", method = RequestMethod.POST)
	public List<WorkLogAllR> selGridMain(HttpServletRequest request, HttpServletResponse response,HttpSession session, WorkLogAllR workLogAllR) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String logKind = workLogAllR.getHlogKind();
		String frDate = workLogAllR.getFrDate();
		String toDate = workLogAllR.getToDate();
		String empNo = workLogAllR.getEmpNo();
		String custCode = workLogAllR.getCustCode();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_LOG_KIND", logKind);
		map.put("V_FR_DATE", frDate);
		map.put("V_TO_DATE", toDate);
		map.put("V_EMP_NO", empNo);
		map.put("V_CUST_CODE", custCode);
		map.put("o_cursor", null);
		workLogAllRService.selGridMain(map);
		List<WorkLogAllR> list  = (List<WorkLogAllR>) map.get("o_cursor");
		return list;
	}	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSel", method = RequestMethod.POST)
	public List<WorkLogAllR> selGridDtl(HttpServletRequest request, HttpServletResponse response,HttpSession session, WorkLogAllR workLogAllR) throws Exception {
		
		String comp = (String) session.getAttribute("compId");
		String logKind = workLogAllR.getHlogKind();
		String frDate = workLogAllR.getFrDate();
		String toDate = workLogAllR.getToDate();
		String empNo = workLogAllR.getEmpNo();
		String custCode = workLogAllR.getCustCode();
		String workKind = workLogAllR.getHworkKind();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_LOG_KIND", logKind);
		map.put("V_FR_DATE", frDate);
		map.put("V_TO_DATE", toDate);
		map.put("V_EMP_NO", empNo);
		map.put("V_WORK_KIND", workKind);
		map.put("V_CUST_CODE", custCode);
		map.put("o_cursor", null);
		workLogAllRService.selGridDtl(map);
		List<WorkLogAllR> list  = (List<WorkLogAllR>) map.get("o_cursor");
		return list;
	}	

}