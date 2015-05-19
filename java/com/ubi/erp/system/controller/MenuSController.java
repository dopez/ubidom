package com.ubi.erp.system.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.system.domain.MenuS;
import com.ubi.erp.system.service.MenuSService;

@RestController
@RequestMapping(value = "/erp/system/menuS")
public class MenuSController {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuSController.class);

	@Autowired
	public MenuSService menuSService;


	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public List<MenuS> getMenu(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(true);
	
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("EMP_NO", session.getAttribute("empNo"));

		param.put("P_RST", null);
		
		menuSService.getMenu(param);

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
		
		menuSService.selMenucd(map);
		
		List<MenuS> menuList = (List<MenuS>) map.get("P_RST");
		
		return menuList;
	}
	
	@RequestMapping(value = "/crudMenuS", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void crudMenuS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		
		String compId = (String) session.getAttribute("compId");
		
		String jsonData = request.getParameter("jsonData");
		
		String pmenucd = request.getParameter("Pmenucd");
		
		String scrnParm = "";
		
		List<MenuS> list = new ArrayList<MenuS>();
		
		ObjectMapper mapper = new ObjectMapper();
		
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<MenuS>>(){});

		for (MenuS menuS : list) {
			menuS.setCompId(compId);
			menuS.setPmenucd(pmenucd);
			menuS.setScrnParm(scrnParm);
			menuSService.crudMenuS(menuS);
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selNoAuthList", method = RequestMethod.POST)
	public List<MenuS> selNoAuthList(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		
		String comp = (String) session.getAttribute("compId");
		
		String menucd = request.getParameter("menucd");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("V_COMP_ID", comp);
		
		map.put("V_MENUCD", menucd);
		
		map.put("P_RST", null);
		
		menuSService.selNoAuthList(map);
		
		List<MenuS> noAuthList = (List<MenuS>) map.get("P_RST");
		
		return noAuthList;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selAuthList", method = RequestMethod.POST)
	public List<MenuS> selAuthList(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		
		String comp = (String) session.getAttribute("compId");
		
		String menucd = request.getParameter("menucd");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("V_COMP_ID", comp);
		
		map.put("V_MENUCD", menucd);
		
		map.put("P_RST", null);
		
		menuSService.selAuthList(map);
		
		List<MenuS> authList = (List<MenuS>) map.get("P_RST");
		logger.debug(menucd);
		return authList;
	}
	
	@RequestMapping(value = "/authSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void authSave(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		
		String compId = (String) session.getAttribute("compId");
		
		String jsonData = request.getParameter("jsonData");
		
		String menucd = request.getParameter("Pmenucd");
		
		String groupgbn = "0";
		
		/***프로시져에서 처리***/
		String modauthority = "";
		
		String prnauthority = "";
		
		List<MenuS> list = new ArrayList<MenuS>();
		
		ObjectMapper mapper = new ObjectMapper();
		
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<MenuS>>(){});
		
		for (MenuS menuS : list) {
			menuS.setCompId(compId);
			menuS.setMenucd(menucd);
			menuS.setGroupgbn(groupgbn);
			menuS.setModauthority(modauthority);
			menuS.setPrnauthority(prnauthority);
			menuSService.authSave(menuS);
		}
	}
}
