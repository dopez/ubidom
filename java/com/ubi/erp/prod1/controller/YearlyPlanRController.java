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

import com.ubi.erp.prod1.domain.YearlyPlanR;
import com.ubi.erp.prod1.service.YearlyPlanRService;

@RestController
@RequestMapping(value = "/erp/prod1/prod/yearlyPlanR")
public class YearlyPlanRController {
	
	@Autowired
	private YearlyPlanRService yearlyPlanRSservice;
	

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch", method = RequestMethod.POST)
	public List<YearlyPlanR> selYearlyPlanS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String frYear = request.getParameter("frYear");
		String toYear = request.getParameter("toYear");
		String itemCode = request.getParameter("itemCode");
		map.put("compId", compId);
		map.put("frYear", frYear);
		map.put("toYear", toYear);
		map.put("prodKind", "1");
		map.put("equiCode", "%");
		map.put("itemCode", itemCode);
		map.put("o_cursor", null);
		yearlyPlanRSservice.selYearlyPlanR(map);
		List<YearlyPlanR> list = (List<YearlyPlanR>) map.get("o_cursor");
		return list;
	}

}
