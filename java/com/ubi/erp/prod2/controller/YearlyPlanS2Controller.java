package com.ubi.erp.prod2.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.prod2.domain.YearlyPlanS2;
import com.ubi.erp.prod2.service.YearlyPlanS2Service;

@RestController
@RequestMapping(value = "/erp/prod2/prod/yearlyPlanS")
public class YearlyPlanS2Controller {
	
	@Autowired
	private YearlyPlanS2Service yearlyPlanSSservice;
	

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selYearlyDate(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String planYear = request.getParameter("planYear");
		String setNumb = request.getParameter("setNumb");
		String equiCode = request.getParameter("equiCode");
		ModelAndView mnv = new ModelAndView("/erp/prod2/prod/yearlyPlanS");
		mnv.addObject("planYear", planYear);
		mnv.addObject("setNumb", setNumb);
		mnv.addObject("equiCode", equiCode);
		return mnv;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch", method = RequestMethod.POST)
	public List<YearlyPlanS2> selYearlyPlanS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String setNumb = request.getParameter("setNumb");
		String planYear = request.getParameter("planYear");
		map.put("compId", compId);
		map.put("planYear", planYear);
		map.put("setNumb", setNumb);
		map.put("prodKind", "2");
		map.put("o_cursor", null);
		yearlyPlanSSservice.selYearlyPlanS2(map);
		List<YearlyPlanS2> list = (List<YearlyPlanS2>) map.get("o_cursor");
		return list;
	}

	
	@RequestMapping(value = "/gridMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsEquiOrderS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String compId = (String) session.getAttribute("compId");
		String jsonData = request.getParameter("jsonData");

		List<YearlyPlanS2> list = new ArrayList<YearlyPlanS2>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<YearlyPlanS2>>() {
		});
		yearlyPlanSSservice.prcsYearlyPlanS2(list, sysEmpNo, compId);
	}
}
