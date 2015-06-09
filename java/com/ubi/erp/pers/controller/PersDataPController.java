package com.ubi.erp.pers.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.cmm.util.PropertyUtil;
import com.ubi.erp.pers.service.PersDataPService;
import com.ubi.erp.rndt.controller.BaseCodeSController;



@RestController
@RequestMapping(value = "/erp/pers/pers/persDataP")
public class PersDataPController {
	@Autowired
	private PersDataPService PersDataPService;
	private static final Logger logger = LoggerFactory.getLogger(BaseCodeSController.class);
	@SuppressWarnings("unchecked")
	@RequestMapping("/report/persDataP")
	public ModelAndView persDataP(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ParseException, IOException {
		String compId = (String) session.getAttribute("compId");
		String empno = request.getParameter("empNo");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", compId);
		map.put("V_EMP_NO", empno);
		map.put("o_cursor", null);
		PersDataPService.selPersData(map);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("V_COMPID", compId);
		map2.put("V_EMP_NO", empno);
		map2.put("o_cursor", null);
		PersDataPService.selFamData(map2);
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("V_COMPID", compId);
		map3.put("V_EMP_NO", empno);
		map3.put("o_cursor", null);
		PersDataPService.selCareerData(map3);
		System.out.println("stage1");
		
		List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("o_cursor");
		List<Map<String, Object>> list2 = (List<Map<String, Object>>) map2.get("o_cursor");
		List<Map<String, Object>> list3 = (List<Map<String, Object>>) map3.get("o_cursor");
		
		System.out.println("stage2");
		
		JRBeanCollectionDataSource datasrc = new JRBeanCollectionDataSource(list);
		JRBeanCollectionDataSource subData1 = new JRBeanCollectionDataSource(list3);
		JRBeanCollectionDataSource subData2 = new JRBeanCollectionDataSource(list2);
		
		System.out.println("stage3");
		File file = new File(PropertyUtil.getString("attach.pers.dir") + "/" + empno + ".jpg");
		FileInputStream fis = null;
		OutputStream os = null;
		fis = new FileInputStream(file);
		os = response.getOutputStream();
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("datasource", datasrc);
		parameterMap.put("SubUrl1", PropertyUtil.getString("prj.base.dir2") + "/WEB-INF/report/pers/persDataPsub1.jasper");
		parameterMap.put("SubData1", subData1);
		parameterMap.put("SubUrl2", PropertyUtil.getString("prj.base.dir2") + "/WEB-INF/report/pers/persDataPsub2.jasper");
		parameterMap.put("SubData2", subData2);
		parameterMap.put("fis", fis);
		parameterMap.put("format", "pdf");
		
		System.out.println("stage4");
		
		//IOUtils.copy(fis, os);
		return new ModelAndView("PersDataP", parameterMap);
		
	}
}
