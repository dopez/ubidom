package com.ubi.erp.pers.controller;

import java.text.ParseException;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.cmm.util.JasperReportUtil;
import com.ubi.erp.cmm.util.gson.DateFormatUtil;
import com.ubi.erp.pers.domain.PersDataP;
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
	public ModelAndView persDataP(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ParseException {
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
		
		List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("o_cursor");
		List<Map<String, Object>> list2 = (List<Map<String, Object>>) map2.get("o_cursor");
		List<Map<String, Object>> list3 = (List<Map<String, Object>>) map3.get("o_cursor");
        System.out.println(list.size());
		for(int i = 0; i < list.size(); i++) {
            System.out.println("one index " + i + " : value " +list.get(i));
        }
        System.out.println();
		list.addAll(list2);
		for(int i = 0; i < list.size(); i++) {
            System.out.println("one index " + i + " : value " +list.get(i));
        }
        System.out.println();
		list.addAll(list3);
        System.out.println(list.size());
		for(int i = 0; i < list.size(); i++) {
            System.out.println("three index " + i + " : value " +list.get(i));
        }
        System.out.println();
		return JasperReportUtil.render("PersDataP",list, "pdf");
		
	}
	/*@SuppressWarnings("unchecked")
	@RequestMapping("/report/persDataPtest")
	public ModelAndView persDataPtest(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ParseException {
		String compId = (String) session.getAttribute("compId");
		String empno = request.getParameter("empNo");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", compId);
		map.put("V_EMP_NO", empno);
		map.put("o_cursor", null);
		PersDataPService.selCareerData(map);
		List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("o_cursor");

		return JasperReportUtil.render("persDataPtest",list, "pdf");
	}
*/
}
