package com.ubi.erp.system.controller;

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

import com.ubi.erp.rndt.domain.BaseCodeS;
import com.ubi.erp.system.domain.MenuS;
import com.ubi.erp.system.service.MenuSService;

@RestController
@RequestMapping(value = "/erp/system/menuS")
public class MenuSController {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuSController.class);

	@Autowired
	public MenuSService menuS;


	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public List<MenuS> getMenu(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(true);
	
		System.out.println("EMPNO"+session.getAttribute("empNo"));
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("EMP_NO", session.getAttribute("empNo"));

		param.put("P_RST", null);
		
		menuS.getMenu(param);

		logger.debug("P_RST" + (List<MenuS>) param.get("P_RST"));

		return (List<MenuS>) param.get("P_RST");
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selMenucd", method = RequestMethod.POST)
	public List<MenuS> selMenucd(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String menucd = request.getParameter("menucd");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("V_CODE", menucd);
		map.put("P_RST", null);
		menuS.selMenucd(map);
		List<MenuS> menuList = (List<MenuS>) map.get("P_RST");
		return menuList;
	}
}
