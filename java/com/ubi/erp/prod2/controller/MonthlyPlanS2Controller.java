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

import com.ubi.erp.prod2.domain.MonthlyPlanS2;
import com.ubi.erp.prod2.service.MonthlyPlanS2Service;

@RestController
@RequestMapping(value = "/erp/prod2/prod/monthlyPlanS")
public class MonthlyPlanS2Controller {
	
	@Autowired
	private MonthlyPlanS2Service monthlyPlanSService;
	

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selMonthlyDate2(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String yyyy = request.getParameter("planMm").substring(0, 4);
		String mm = request.getParameter("planMm").substring(4, 6);
		String setNumb = request.getParameter("setNumb");
		String equiCode = request.getParameter("equiCode");
		ModelAndView mnv = new ModelAndView("/erp/prod2/prod/monthlyPlanS");
		mnv.addObject("planMm", yyyy + "/" + mm);
		mnv.addObject("setNumb", setNumb);
		mnv.addObject("equiCode", equiCode);
		return mnv;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch", method = RequestMethod.POST)
	public List<MonthlyPlanS2> selMonthlyPlanS2(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String setNumb = request.getParameter("setNumb");
		String planMm = request.getParameter("planMm");
		map.put("compId", compId);
		map.put("planMm", planMm);
		map.put("setNumb", setNumb);
		map.put("prodKind", "2");
		map.put("o_cursor", null);
		monthlyPlanSService.selMonthlyPlanS2(map);
		List<MonthlyPlanS2> list = (List<MonthlyPlanS2>) map.get("o_cursor");
		return list;
	}

	
	@RequestMapping(value = "/gridMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsMonthlyPlanS2(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String compId = (String) session.getAttribute("compId");
		String jsonData = request.getParameter("jsonData");

		List<MonthlyPlanS2> list = new ArrayList<MonthlyPlanS2>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<MonthlyPlanS2>>() {
		});
		monthlyPlanSService.prcsMonthlyPlanS2(list, sysEmpNo, compId);
	}
}
