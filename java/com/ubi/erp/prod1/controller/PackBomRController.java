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

import com.ubi.erp.prod1.domain.PackBomR;
import com.ubi.erp.prod1.service.PackBomRService;

@RestController
@RequestMapping(value = "/erp/prod1/stan/packBomR")
public class PackBomRController {
	
	@Autowired
	private PackBomRService packBomRService;


	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/MainSearch", method = RequestMethod.POST)
	public List<PackBomR> selYearlyPlanS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String keyValue = request.getParameter("keyValue");
		map.put("compId", compId);
		map.put("keyValue", keyValue);
		map.put("o_cursor", null);
		packBomRService.selPackBomR(map);
		List<PackBomR> list = (List<PackBomR>) map.get("o_cursor");
		return list;
	}
}
