package com.ubi.erp.prod1.controller;

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

import com.ubi.erp.prod1.domain.MonthlyPlanR;
import com.ubi.erp.prod1.service.MonthlyPlanRService;

@RestController
@RequestMapping(value = "/erp/prod1/prod/monthlyPlanR")
public class MonthlyPlanRController {
	
	@Autowired
	private MonthlyPlanRService monthlyPlanRService;
	

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch", method = RequestMethod.POST)
	public List<MonthlyPlanR> selMonthlyPlanR(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String frMm = request.getParameter("frMm");
		String toMm = request.getParameter("toMm");
		String itemCode = request.getParameter("itemCode");
		map.put("compId", compId);
		map.put("frMm", frMm);
		map.put("toMm", toMm);
		map.put("prodKind", "1");
		map.put("equiCode", "%");
		map.put("itemCode", itemCode);
		map.put("o_cursor", null);
		monthlyPlanRService.selMonthlyPlanR(map);
		List<MonthlyPlanR> list = (List<MonthlyPlanR>) map.get("o_cursor");
		return list;
	}

}
