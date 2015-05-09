package com.ubi.erp.cmm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JspController {

	@RequestMapping(value = "/**/*.do", method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest req, HttpServletResponse res) {
		
		String uri = req.getRequestURI();

		ModelAndView mav = new ModelAndView();
		mav.setViewName(uri.replace(".do", ""));

		return mav;
	}
}
