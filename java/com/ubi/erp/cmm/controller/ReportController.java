package com.ubi.erp.cmm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.cmm.util.JasperReportUtil;
import com.ubi.erp.cmm.util.PropertyUtil;
import com.ubi.erp.user.service.UserService;


@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
    private UserService userService;

	@RequestMapping("/reportPdf")
	public ModelAndView reportPdf(HttpServletRequest request, HttpServletResponse response) {
		List<Map<String, Object>> list1 = userService.selUser();
		List<Map<String, Object>> list2 = userService.selSub1();
		List<Map<String, Object>> list3 = userService.selSub2();

		JRBeanCollectionDataSource datasrc = new JRBeanCollectionDataSource(list1);
		JRBeanCollectionDataSource subData1 = new JRBeanCollectionDataSource(list2);
		JRBeanCollectionDataSource subData2 = new JRBeanCollectionDataSource(list3);

		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("datasource", datasrc);
		parameterMap.put("SubUrl1", PropertyUtil.getString("prj.base.dir") + "/WEB-INF/report/SYS_USER_SUB1.jasper");
		parameterMap.put("SubData1", subData1);
		parameterMap.put("SubUrl2", PropertyUtil.getString("prj.base.dir") + "/WEB-INF/report/SYS_USER_SUB2.jasper");
		parameterMap.put("SubData2", subData2);
		parameterMap.put("format", "pdf");

		return new ModelAndView("simpleReport", parameterMap);
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