package com.ubi.erp.comm.controller;

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

import com.ubi.erp.cmm.util.MakeResponseUtil;
import com.ubi.erp.cmm.util.gson.JsonUtil;
import com.ubi.erp.comm.domain.FactoryCalS;
import com.ubi.erp.comm.service.FactoryCalSService;

@RestController
@RequestMapping(value = "/erp/comm/stan/factoryCalS")
public class FactoryCalSController {
	
	@Autowired
	private FactoryCalSService factoryCalSSservice;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<FactoryCalS> selFactoryCalS(HttpServletRequest request, HttpServletResponse response,HttpSession session,FactoryCalS factoryCalS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String yyyy = factoryCalS.getYyyy();
		String mm = factoryCalS.getMm();
		map.put("compId", compId);
		map.put("yyyy", yyyy);
		map.put("mm", mm);
		map.put("o_cursor", null);
		factoryCalSSservice.selFactoryCalS(map);
		List<FactoryCalS> list = (List<FactoryCalS>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/initCalendar",method = RequestMethod.POST)
	public void prcsFactoryCalendar(HttpServletRequest request, HttpServletResponse response,HttpSession session,FactoryCalS factoryCalS) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String compId = (String) session.getAttribute("compId");
			String empNo = (String) session.getAttribute("empNo");
			String yyyy = factoryCalS.getYyyy();
			String mm = factoryCalS.getMm();
			String weekKnd = factoryCalS.getWeekKnd();
			map.put("compId", compId);
			map.put("yyyy", yyyy);
			map.put("mm", mm);
			map.put("weekKnd", weekKnd);
			map.put("empNo", empNo);
			factoryCalSSservice.initFactoryCalendar(map);

			Map<String, String> map2 = new HashMap<String, String>();
			map2.put("rtnCode", "1");
			String jsonStr = new String(JsonUtil.parseToString(map2));
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
	
	@RequestMapping(value = "/gridMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsAcademicDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		try {
			String compId = (String) session.getAttribute("compId");
			String sysEmpNo = (String) session.getAttribute("empNo");
			String jsonData = request.getParameter("jsonData");
			String yValue = request.getParameter("yyyy");
			String mValue = request.getParameter("mm");
			String weKnd = request.getParameter("weKnd");
			List<FactoryCalS> list = new ArrayList<FactoryCalS>();
			ObjectMapper mapper = new ObjectMapper();
			list = mapper.readValue(jsonData, new TypeReference<ArrayList<FactoryCalS>>() {
			});
			factoryCalSSservice.saveFactoryCalS(list, sysEmpNo, compId, yValue, mValue, weKnd);

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
