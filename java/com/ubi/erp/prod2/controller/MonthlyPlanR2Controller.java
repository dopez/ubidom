package com.ubi.erp.prod2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.prod2.domain.MonthlyPlanR2;
import com.ubi.erp.prod2.service.MonthlyPlanR2Service;

@RestController
@RequestMapping(value = "/erp/prod2/prod/monthlyPlanR")
public class MonthlyPlanR2Controller {
	
	@Autowired
	private MonthlyPlanR2Service monthlyPlanRService;
	

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch", method = RequestMethod.POST)
	public List<MonthlyPlanR2> selMonthlyPlanR2(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String frMm = request.getParameter("frMm");
		String toMm = request.getParameter("toMm");
		String equiCode = request.getParameter("equiCode");
		map.put("compId", compId);
		map.put("frMm", frMm);
		map.put("toMm", toMm);
		map.put("prodKind", "2");
		map.put("equiCode", equiCode);
		map.put("itemCode", "%");
		map.put("o_cursor", null);
		monthlyPlanRService.selMonthlyPlanR2(map);
		List<MonthlyPlanR2> list = (List<MonthlyPlanR2>) map.get("o_cursor");
		return list;
	}

}
