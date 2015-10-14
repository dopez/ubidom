package com.ubi.erp.cmm.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.cmm.util.gson.JsonUtil;

@Controller
public class JspController {

	@RequestMapping(value = "/**/*.do", method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest req, HttpServletResponse res) {
		
		String uri = req.getRequestURI();

		ModelAndView mav = new ModelAndView();
		mav.setViewName(uri.replace(".do", ""));
		Enumeration<String> params = req.getParameterNames();

		if (params.hasMoreElements()) {
			req.setAttribute("PARAM_INFO", JsonUtil.parseToString(req.getParameterMap()));
		} else {
			req.setAttribute("PARAM_INFO", "{\"param\":[\"null\"]}");
		}

		return mav;
	}
}
