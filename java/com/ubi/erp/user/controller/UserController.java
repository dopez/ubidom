package com.ubi.erp.user.controller;

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

import com.ubi.erp.user.domain.Menu;
import com.ubi.erp.user.service.UserService;

@RestController
@RequestMapping(value = "/erp/user/menu")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	public UserService svc;


	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public List<Menu> getMenu(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(true);
	
		System.out.println("EMPNO"+session.getAttribute("empNo"));
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("EMP_NO", session.getAttribute("empNo"));

		param.put("P_RST", null);
		
		svc.getMenu(param);

		logger.debug("P_RST" + (List<Menu>) param.get("P_RST"));

		return (List<Menu>) param.get("P_RST");
	}
}
