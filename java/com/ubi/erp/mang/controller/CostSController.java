package com.ubi.erp.mang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ubi.erp.acnt.controller.AccCodeSController;
import com.ubi.erp.acnt.domain.AccCodeS;
import com.ubi.erp.acnt.service.AccCodeSService;
import com.ubi.erp.mang.service.CostSService;

@Controller
@RequestMapping(value = "/erp/pers/pers/academicDataS")
public class CostSController {
 	private static final Logger logger = LoggerFactory.getLogger(AccCodeSController.class);

	@Autowired
	private CostSService costS;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/searchA",method = RequestMethod.POST)
	public List<AccCodeS> getSrhA(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		String acCd1 = request.getParameter("acCd1");

		map.put("V_COMPID", "");
		map.put("V_AC_CD1", acCd1);
		map.put("o_cursor", null);
		return null;

	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/searchB",method = RequestMethod.POST)
	public List<AccCodeS> getSrhB(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		String acCd1 = request.getParameter("acCd1");

		map.put("V_COMPID", "");
		map.put("V_AC_CD1", acCd1);
		map.put("o_cursor", null);
		return null;

	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/searchC",method = RequestMethod.POST)
	public List<AccCodeS> getSrhC(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		String acCd1 = request.getParameter("acCd1");

		map.put("V_COMPID", "");
		map.put("V_AC_CD1", acCd1);
		map.put("o_cursor", null);
		return null;

	}
}
