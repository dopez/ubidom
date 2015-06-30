package com.ubi.erp.plan.controller;

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

import com.ubi.erp.plan.domain.PurcConferOrderR;
import com.ubi.erp.plan.service.PurcConferOrderRService;
import com.ubi.erp.sale.controller.WorkLogSController;

@RestController
@RequestMapping(value="/erp/plan/purc/orderR")
public class PurcConferOrderRController {

	private static final Logger logger = LoggerFactory.getLogger(WorkLogSController.class);
	
	@Autowired
	private PurcConferOrderRService purcConferOrderRService;
	
	public ModelAndView getSession(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException{
		String empNo = (String) session.getAttribute("empNo");
		String empName = (String) session.getAttribute("empName");
		String comp = (String) session.getAttribute("compId");
		ModelAndView mnv = new ModelAndView("/erp/plan/purc/orderR");
		mnv.addObject("empNo", empNo);
		mnv.addObject("empName", empName);
		mnv.addObject("compId", comp);
		return mnv;
	}	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSel", method = RequestMethod.POST)
	public List<PurcConferOrderR> gridMainSel(HttpServletRequest request, HttpServletResponse response,HttpSession session, PurcConferOrderR purcConferOrderR) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setSDate = purcConferOrderR.getSetSDate();
		String setEDate = purcConferOrderR.getSetEDate();
		String custCode = purcConferOrderR.getCustCode();
		String postCode = purcConferOrderR.getPostCode();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_SDATE", setSDate);
		map.put("V_SET_EDATE", setEDate);
		map.put("V_CUST_CODE", custCode);
		map.put("V_POST_CODE", postCode);
		map.put("o_cursor", null);
		purcConferOrderRService.gridMainSel(map);
		List<PurcConferOrderR> list  = (List<PurcConferOrderR>) map.get("o_cursor");
		
		logger.debug("resultset is "+list);
		
		return list;
	}		
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/seqReturn",method = RequestMethod.POST)
	public List<PurcConferOrderR> getSeqReturn(HttpServletRequest request,HttpServletResponse response, HttpSession session, PurcConferOrderR purcConferOrderR) throws Exception {

	    Map<String, Object> map = new HashMap<String, Object>();
	    String compId = (String) session.getAttribute("compId");

	    String tableName = request.getParameter("tableName");
	    String seqColumn = request.getParameter("seqColumn");
	    String dateColumn1 = request.getParameter("dateColumn1");
	    String columnData1 = request.getParameter("columnData1");
	    String dateColumn2 = request.getParameter("dateColumn2");
	    String columnData2 = request.getParameter("columnData2");
	    String returnLen_string=request.getParameter("returnLen");
	    int returnLen=Integer.parseInt(returnLen_string);
	    
		map.put("V_COMPID",compId);
		map.put("V_TABLE_NAME",tableName);
		map.put("V_SEQ_COLUMN",seqColumn);
		map.put("V_DATE_COLUMN1",dateColumn1);
		map.put("V_COLUMN_DATA1", columnData1);
		map.put("V_DATE_COLUMN2", dateColumn2);
		map.put("V_COLUMN_DATA2", columnData2);
		map.put("V_RETURN_LEN", returnLen);
		map.put("o_cursor", null);

		purcConferOrderRService.getSeqReturn(map);

		List<PurcConferOrderR> list = (List<PurcConferOrderR>) map.get("o_cursor");

		logger.debug("resultset is "+list);

		return list;
	}	
}
