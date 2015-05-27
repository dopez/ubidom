package com.ubi.erp.pers.controller;

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


import com.ubi.erp.pers.domain.PositionByPersonR;

import com.ubi.erp.pers.service.PositionByPersonRService;

@RestController
@RequestMapping(value = "/erp/pers/pers/positionByPersonR")
public class PositionByPersonRController {

	@Autowired
	private PositionByPersonRService positionByPersonRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/search",method = RequestMethod.POST)
	public List<PositionByPersonR> selPersDataSL(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");;
		map.put("V_COMP_ID", compId);
		map.put("V_JIKGUN", "%");
		map.put("V_SERVE_GBN", "%");
		map.put("o_cursor", null);
		positionByPersonRService.selPositionByPersonR(map);
		List<PositionByPersonR> list = (List<PositionByPersonR>) map.get("o_cursor");
		return list;
	}
}
