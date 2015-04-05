package com.ubi.erp.cmm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.cmm.util.JasperReportUtil;
import com.ubi.erp.user.service.UserService;


@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
    private UserService userService;

	@RequestMapping("/simpleReport")
	public ModelAndView sysUser(HttpServletRequest request, HttpServletResponse response) {
		List<Map<String, Object>> list = userService.selUser();
		return JasperReportUtil.render("simpleReport", list, "pdf");
	}
}