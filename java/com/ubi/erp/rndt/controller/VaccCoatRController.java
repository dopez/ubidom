package com.ubi.erp.rndt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.rndt.domain.VaccCoatR;
import com.ubi.erp.rndt.service.VaccCoatRService;



@RestController
@RequestMapping(value="/erp/rndt/stan/vaccCoatR")
public class VaccCoatRController {

	
	@Autowired
	private VaccCoatRService VaccCoatRService;
	private static final Logger logger = LoggerFactory.getLogger(VaccCoatRController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSel", method = RequestMethod.POST)
	public List<VaccCoatR> selGridMain(HttpServletRequest request, HttpServletResponse response,HttpSession session, VaccCoatR vaccCoatR) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String matrCodeMj = request.getParameter("mjCode");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("V_MATR_CODE_MJ", matrCodeMj);
		map.put("o_cursor", null);
		VaccCoatRService.selGridMain(map);
		List<VaccCoatR> list  = (List<VaccCoatR>) map.get("o_cursor");
		return list;
	}	
}