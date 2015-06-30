package com.ubi.erp.prod1.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.cmm.util.MakeResponseUtil;
import com.ubi.erp.cmm.util.gson.JsonUtil;
import com.ubi.erp.prod1.domain.YearlyPlanS;
import com.ubi.erp.prod1.service.YearlyPlanSService;

@RestController
@RequestMapping(value = "/erp/prod1/prod/yearlyPlanS")
public class YearlyPlanSController {
	
	@Autowired
	private YearlyPlanSService yearlyPlanSSservice;
	

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selYearlyDate(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String planYear = request.getParameter("planYear");
		String setNumb = request.getParameter("setNumb");
		ModelAndView mnv = new ModelAndView("/erp/prod1/prod/yearlyPlanS");
		mnv.addObject("planYear", planYear);
		mnv.addObject("setNumb", setNumb);
		return mnv;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch", method = RequestMethod.POST)
	public List<YearlyPlanS> selYearlyPlanS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String setNumb = request.getParameter("setNumb");
		String planYear = request.getParameter("planYear");
		map.put("compId", compId);
		map.put("planYear", planYear);
		map.put("setNumb", setNumb);
		map.put("prodKind", "1");
		map.put("o_cursor", null);
		yearlyPlanSSservice.selYearlyPlanS(map);
		List<YearlyPlanS> list = (List<YearlyPlanS>) map.get("o_cursor");
		return list;
	}

	
	@RequestMapping(value = "/gridMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsEquiOrderS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		try {
			String sysEmpNo = (String) session.getAttribute("empNo");
			String compId = (String) session.getAttribute("compId");
			String jsonData = request.getParameter("jsonData");

			List<YearlyPlanS> list = new ArrayList<YearlyPlanS>();
			ObjectMapper mapper = new ObjectMapper();
			list = mapper.readValue(jsonData, new TypeReference<ArrayList<YearlyPlanS>>() {
			});
			yearlyPlanSSservice.prcsYearlyPlanS(list, sysEmpNo, compId);

			Map<String, String> map = new HashMap<String, String>();
			map.put("rtnCode", "1");
			String jsonStr = new String(JsonUtil.parseToString(map));
			MakeResponseUtil.makeResponse(response, "json", jsonStr);
		} catch (DuplicateKeyException e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR005");
		} catch (Exception e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR002");
		} finally {
			if (!ht.isEmpty()) {
				response.setHeader("EXCEPTION", "Y");
				MakeResponseUtil.makeResponse(response, "json", JsonUtil.parseToString(ht));
			}
		}
	}
}
