package com.ubi.erp.cmm.util;

import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.springframework.web.servlet.ModelAndView;

public class JasperReportUtil extends Exception {

	private static final long serialVersionUID = 1L;

	public static ModelAndView render(String templateId, List<Map<String, Object>> list, String fmt) {

		JRBeanCollectionDataSource src = new JRBeanCollectionDataSource(list);
		ModelAndView mv = new ModelAndView();

		mv.setViewName(templateId);
		mv.addObject("format", fmt);
		mv.addObject("datasource", src);

		return mv;
	}
} 