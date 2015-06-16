package com.ubi.erp.rndt.controller;

import java.text.ParseException;

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

import com.ubi.erp.sale.service.WorkLogSService;



@RestController
@RequestMapping(value = "/erp/rndt/wlog/workLogS")
public class WorkLogSRndtController {

	
	@Autowired
	private WorkLogSService workLogSService;
	private static final Logger logger = LoggerFactory.getLogger(WorkLogSRndtController.class);
	
	
	public ModelAndView getSession(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException{
		String empNo = (String) session.getAttribute("empNo");
		String empName = (String) session.getAttribute("empName");
		ModelAndView mnv = new ModelAndView("/erp/rndt/wlog/workLogS");
		mnv.addObject("empNo", empNo);
		mnv.addObject("empName", empName);
		return mnv;
		
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selDevPlanS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String logkind = request.getParameter("logkind");
		String logdate = request.getParameter("logdate");
		String logempno = request.getParameter("logempno");
		String logseq = request.getParameter("logseq");
		String lognum = request.getParameter("lognum");
		String logname = request.getParameter("logname");

		ModelAndView mnv2 = new ModelAndView("/erp/rndt/wlog/workLogS");
		mnv2.addObject("logkind", logkind);
		mnv2.addObject("logdate", logdate);
		mnv2.addObject("empNo", logempno);
		mnv2.addObject("logseq", logseq);
		mnv2.addObject("lognum", lognum);
		mnv2.addObject("logname", logname);
			return mnv2;
	}

}