package com.ubi.erp.cmm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class SessionCheckInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null && (String) session.getAttribute("uid") != null) {
			return true;
		} else {
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
			response.sendRedirect("/sys/error/401.jsp");
			return false;
		}
	}
}