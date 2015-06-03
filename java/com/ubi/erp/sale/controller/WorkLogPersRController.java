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
import com.ubi.erp.sale.domain.WorkLogPersR;
import com.ubi.erp.sale.domain.WorkLogS;
import com.ubi.erp.sale.service.WorkLogPersRService;



@RestController
@RequestMapping(value="/erp/sale/wlog/workLogPersR")
public class WorkLogPersRController {

	
	@Autowired
	private WorkLogPersRService workLogPersRService;
	private static final Logger logger = LoggerFactory.getLogger(WorkLogPersRController.class);
	
	
	public ModelAndView getSession(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException{
		String empNo = (String) session.getAttribute("empNo");
		String empName = (String) session.getAttribute("empName");
		ModelAndView mnv = new ModelAndView("/erp/sale/wlog/workLogS");
		mnv.addObject("empNo", empNo);
		mnv.addObject("empName", empName);
		return mnv;
		
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSel", method = RequestMethod.POST)
	public List<WorkLogPersR> selGridMain(HttpServletRequest request, HttpServletResponse response,HttpSession session, WorkLogS workLogS) throws Exception {
		DateFormatUtil df = new DateFormatUtil();

		String comp = (String) session.getAttribute("compId");
		String logKind = request.getParameter("logKind");
		String frDate = df.dateToString(request.getParameter("frDate"));
		String toDate = df.dateToString(request.getParameter("toDate"));
		String empNo = request.getParameter("empNo");
		String workKind = request.getParameter("workKind");
		String custCode = request.getParameter("custCode");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_LOG_KIND", logKind);
		map.put("V_FR_DATE", frDate);
		map.put("V_TO_DATE", toDate);
		map.put("V_EMP_NO", empNo);
		map.put("V_WORK_KIND", workKind);
		map.put("V_CUST_CODE", custCode);
		map.put("o_cursor", null);
		workLogPersRService.selGridMain(map);
		List<WorkLogPersR> list  = (List<WorkLogPersR>) map.get("o_cursor");
		for(int i = 0; i<list.size();i++){
			list.get(i).setLogDate(df.dateToString2(list.get(i).getLogDate()));
		}
		return list;
	}	

}