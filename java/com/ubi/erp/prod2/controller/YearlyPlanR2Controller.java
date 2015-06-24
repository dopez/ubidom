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

import com.ubi.erp.prod2.domain.YearlyPlanR2;
import com.ubi.erp.prod2.service.YearlyPlanR2Service;

@RestController
@RequestMapping(value = "/erp/prod2/prod/yearlyPlanR")
public class YearlyPlanR2Controller {
	
	@Autowired
	private YearlyPlanR2Service yearlyPlanRSservice;
	

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch", method = RequestMethod.POST)
	public List<YearlyPlanR2> selYearlyPlanS2(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String frYear = request.getParameter("frYear");
		String toYear = request.getParameter("toYear");
		String equiCode = request.getParameter("equiCode");
		map.put("compId", compId);
		map.put("frYear", frYear);
		map.put("toYear", toYear);
		map.put("prodKind", "2");
		map.put("equiCode", equiCode);
		map.put("itemCode", "%");
		map.put("o_cursor", null);
		yearlyPlanRSservice.selYearlyPlanR2(map);
		List<YearlyPlanR2> list = (List<YearlyPlanR2>) map.get("o_cursor");
		return list;
	}

}
