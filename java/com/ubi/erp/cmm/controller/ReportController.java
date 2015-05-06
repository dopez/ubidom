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

	@RequestMapping("/reportPdf")
	public ModelAndView reportPdf(HttpServletRequest request, HttpServletResponse response) {
		List<Map<String, Object>> list = userService.selUser();
		return JasperReportUtil.render("simpleReport", list, "pdf");
	}
	@RequestMapping("/testPdf")
	public ModelAndView testPdf(HttpServletRequest request, HttpServletResponse response) {
		List<Map<String, Object>> list = userService.selItem();
		return JasperReportUtil.render("testReport", list, "pdf");
	}

	@RequestMapping("/reportExcel")
	public ModelAndView reportExcel(HttpServletRequest request, HttpServletResponse response) {
		List<Map<String, Object>> list = userService.selUser();
		return JasperReportUtil.render("simpleReport", list, "xls");
	}
}