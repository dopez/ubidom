package com.ubi.erp.prod1.controller;

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

import com.ubi.erp.prod1.domain.MonthlyPlanS;
import com.ubi.erp.prod1.service.MonthlyPlanSService;

@RestController
@RequestMapping(value = "/erp/prod1/prod/monthlyPlanS")
public class MonthlyPlanSController {
	
	@Autowired
	private MonthlyPlanSService monthlyPlanSService;
	

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selMonthlyDate(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String yyyy = request.getParameter("planMm").substring(0, 4);
		String mm = request.getParameter("planMm").substring(4, 6);
		String setNumb = request.getParameter("setNumb");
		ModelAndView mnv = new ModelAndView("/erp/prod1/prod/monthlyPlanS");
		mnv.addObject("planMm", yyyy + "/" + mm);
		mnv.addObject("setNumb", setNumb);
		return mnv;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch", method = RequestMethod.POST)
	public List<MonthlyPlanS> selMonthlyPlanS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String setNumb = request.getParameter("setNumb");
		String planMm = request.getParameter("planMm");
		map.put("compId", compId);
		map.put("planMm", planMm);
		map.put("setNumb", setNumb);
		map.put("o_cursor", null);
		monthlyPlanSService.selMonthlyPlanS(map);
		List<MonthlyPlanS> list = (List<MonthlyPlanS>) map.get("o_cursor");
		return list;
	}

	
	@RequestMapping(value = "/gridMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsMonthlyPlanS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String compId = (String) session.getAttribute("compId");
		String jsonData = request.getParameter("jsonData");

		List<MonthlyPlanS> list = new ArrayList<MonthlyPlanS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<MonthlyPlanS>>() {
		});
		monthlyPlanSService.prcsMonthlyPlanS(list, sysEmpNo, compId);
	}
}
