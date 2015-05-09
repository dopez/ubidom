package com.ubi.erp.cmm.controller;

import java.io.IOException;
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


import com.ubi.erp.user.domain.User;
import com.ubi.erp.user.service.UserService;


@RestController
public class LoginController {

	@Autowired
    private UserService userService;
	

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Map loginProc(HttpServletRequest request, HttpServletResponse response) {
		
		String uid = request.getParameter("uid");
		String passwd = request.getParameter("passwd");
		Map<String, String> map = new HashMap<String, String>();
	
		// 여기서 커서로 리턴받아 그 값이 0/1 인지 확인하려고 합니다
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("P_LOG_ID", uid);
		param.put("P_LOG_PASS", passwd);
		param.put("P_RST", null);
		userService.getUser(param);
		List<User> list =  (List<User>) param.get("P_RST");
		
		if(list.size()==1) {
			if(list.get(0)!=null) {
				User user = (User)list.get(0);
				HttpSession session = request.getSession(false);
				if (session != null) {
					session.invalidate();
				}
				session = request.getSession(true);
				
				session.setAttribute("uid", user.getCustCode());
				session.setAttribute("uname", user.getCustName());
				session.setAttribute("empNo", user.getEmpNo());
				session.setAttribute("empName", user.getEmpName());
				System.out.println("empNo"+ user.getEmpNo());
				System.out.println("empName"+ user.getEmpName());
				map.put("rtnCode", "1");
				map.put("uid", uid);
				map.put("errorMsg", "");
			}
		}

		return map;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public Map logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}

		Map<String, String> map = new HashMap<String, String>();
		map.put("rtnCode", "1");
		map.put("rtnCode", "1");

		return map;
	}
}