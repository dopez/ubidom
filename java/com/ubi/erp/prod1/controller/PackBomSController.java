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

import com.ubi.erp.prod1.domain.PackBomS;
import com.ubi.erp.prod1.service.PackBomSService;

@RestController
@RequestMapping(value = "/erp/prod1/prod/packBomS")
public class PackBomSController {
	
	@Autowired
	private PackBomSService packBomSService;


	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/treeSearch", method = RequestMethod.POST)
	public List<PackBomS> selYearlyPlanS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		map.put("compId", compId);
		map.put("keyValue", "111111");
		map.put("o_cursor", null);
		packBomSService.selPackBomSTree(map);
		List<PackBomS> list = (List<PackBomS>) map.get("o_cursor");
		return list;
	}

}
